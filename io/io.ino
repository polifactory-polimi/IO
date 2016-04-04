/*
 * IO-Arduino
 * 
 * Copyright (C) 2016 Nicola Corna <nicola@corna.info>
 *
 * This file is part of IO
 *
 * IO is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * IO is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

#include <ArduinoJson.h>
#include <Adafruit_GFX.h>

// WARNING! This is not the "standard" Adafruit's RGBmatrixPanel library, this is the
// modified version with multi-panel support. You can download it here:
// https://github.com/polifactory-polimi/RGB-matrix-Panel
#include <RGBmatrixPanel.h>

#include "Icons.h"
#include "FacebookIcon.h"

#define CLK 11
#define LAT A3
#define OE  6
#define A   A0
#define B   A1
#define C   A2

RGBmatrixPanel matrix(A, B, C, CLK, LAT, OE, true, 2);

#define STX char(0x02)
#define ETX char(0x03)
#define DEGREES char(0xF7)

const char celsiusDegrees[] = { ' ', DEGREES, 'C', '\0' };

struct DisplayData {
  char text[32];
  bool scrolling;
  const iconInfo *icon;
  uint8_t duration;   //If scrolling == true it is the number of passes, otherwise it is the number of ms / 100
};

const uint8_t scrollingExtraSpace = 12;

const DisplayData welcome = {
  "Hello, I'm IO",
  .scrolling = true,
  .icon = NULL,
  .duration = 1
};

const DisplayData facebook = {
  "#nextdesigninnovation",
  .scrolling = true,
  .icon = &facebookLogo,
  .duration = 1
};

DisplayData curDate = {
  "NO_DATE_YET",
  .scrolling = true,
  .icon = NULL,
  .duration = 1
};

DisplayData curTime = {
  "NO_TIME_YET",
  .scrolling = false,
  .icon = NULL,
  .duration = 60
};

DisplayData curWeather = {
  "NO_WEATHER_YET",
  .scrolling = true,
  .icon = NULL,
  .duration = 1
};

DisplayData curTemperature = {
  "NO_TEMP_YET",
  .scrolling = false,
  .icon = NULL,
  .duration = 60
};

const iconInfo *weatherIcons(uint16_t weatherId) {
  //Refer to http://openweathermap.org/weather-conditions

  // Unfortunately no icon has been created yet; if you want to create them by yourself
  // edit all the weather::dxx_icon matrixes (bitmap) and weather::dxx structures (width
  // and color), then remove the following line
  return NULL;

  switch (weatherId / 100) {
    case 2: //Thunderstorm
      return &weather::d11;

    case 3: //Drizzle
      return &weather::d09;

    case 5: //Rain
      if (weatherId < 510)
        return &weather::d10;
      else if (weatherId >= 520)
        return &weather::d09;
      else
        return &weather::d13;

    case 6: //Snow
      return &weather::d13;

    case 7: //Atmosphere
      return &weather::d50;

    case 8: //Clear (800) and clouds
      switch (weatherId) {
        case 800:
          return &weather::d01;

        case 801:
          return &weather::d02;

        case 802:
          return &weather::d03;

        case 803:
        case 804:
        default:
          return &weather::d02;
      }
  }

  return NULL;
}

void setup() {
  Serial.begin(9600);
  Serial1.begin(1200);

  matrix.begin();
  matrix.setTextSize(1);
  matrix.setTextWrap(false);
}

void loop() {
  static const DisplayData *displayData[] = {
    &welcome,
    &facebook,
    &curDate,
    &curTime,
    &curWeather,
    &curTemperature
  };
  static const uint8_t modesNum = sizeof(displayData) / sizeof(displayData[0]);

  static uint8_t i = 0;
  static uint16_t horiz = 0;
  static uint8_t scrollCount = 0;
  static unsigned long start = 0;

  static DisplayData curDisplayData = *displayData[i];

  if (curDisplayData.scrolling) {
    if (millis() - start > 20) {
      matrix.fillScreen(0);
      matrix.setCursor(64 - horiz, 4);
      matrix.print(curDisplayData.text);
  
      if (curDisplayData.icon) {
        matrix.fillRect(0, 4, curDisplayData.icon->width + 1, 8, 0);
        matrix.drawBitmap(0, 0, curDisplayData.icon->icon, curDisplayData.icon->width, 16, curDisplayData.icon->color);
      }
  
      if (horiz == 64 + 6 * strlen(curDisplayData.text) + scrollingExtraSpace - (curDisplayData.icon ? curDisplayData.icon->width + 1 : 0)) {
        ++scrollCount;
        horiz = 0;
      }
      else
        horiz++;
  
      if (scrollCount >= curDisplayData.duration) {
        scrollCount = 0;
        i = (i + 1) % modesNum;
        curDisplayData = *displayData[i];
        start = 0;
      }
      else
        start = millis();

      matrix.swapBuffers(false);
    }
  }
  else {
    if (start == 0) {
      matrix.fillScreen(0);
      matrix.setCursor(32 - 3 * strlen(curDisplayData.text), 4);
      matrix.print(curDisplayData.text);
      start = millis();
      matrix.swapBuffers(false);
    }
    else if (millis() - start > curDisplayData.duration * 100) {
      i = (i + 1) % modesNum;
      curDisplayData = *displayData[i];
      start = 0;
    }
  }
}

void serialEvent1() {
  static String jsonRx;
  char buffer[65];
  int16_t start;
  int16_t end;
  String fullJson;

  end = Serial1.available();
  Serial1.readBytes(buffer, end);
  buffer[end] = '\0';

  jsonRx += buffer;
  end = jsonRx.indexOf(ETX);

  if (end > 0) {
    start = jsonRx.indexOf(STX);

    if (start >= 0 && start < end) {
      StaticJsonBuffer<1024> jsonBuffer;
      fullJson = jsonRx.substring(start + 1, end);

      JsonObject& root = jsonBuffer.parseObject(fullJson);

      if (root.success()) {
        char tempStr[32];
        uint16_t weatherId;

        strcpy(tempStr, root["date"]["date"]);
        if (strlen(tempStr) != 0)
          strcpy(curDate.text, tempStr);

        strcpy(tempStr, root["date"]["time"]);
        if (strlen(tempStr) != 0)
          strcpy(curTime.text, tempStr);

        //strcpy(tempStr, root["weather"]["weather"][0]["main"]);
        strcpy(tempStr, root["weather"]["weather"][0]["description"]);
        weatherId = root["weather"]["weather"][0]["id"];
        if (strlen(tempStr) != 0 && weatherId != 0) {
          tempStr[0] = toupper(tempStr[0]);   //Make the first letter uppercase
          strcpy(curWeather.text, tempStr);
          curWeather.icon = weatherIcons(weatherId);
        }

        strcpy(tempStr, root["weather"]["main"]["temp"]);
        if (strlen(tempStr) != 0) {
          char *dotPtr = strchr(tempStr, '.');

          if (dotPtr != NULL)
            if (*(dotPtr + 1) != '\0' && *(dotPtr + 2) != '\0')
              *(dotPtr + 2) = '\0';   //Truncate every decimal after the 1st

          strcpy(curTemperature.text, tempStr);
          strcat(curTemperature.text, celsiusDegrees);
        }
      }
      else {
        Serial.println("JSON parsing failed!");
        Serial.println(fullJson);
      }
    }

    jsonRx.remove(0, end + 1);
  }
}

