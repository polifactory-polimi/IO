/*
 * IO-ESP8266-adapter
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
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>

#include <ctime>
#include <cstdio>
#include <stdint.h>

#define OPENWEATHERMAP_APIKEY "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
#define TIMEZONEDB_APIKEY "XXXXXXXXXXXX"

const char *ssid = "IO_setup";
const char *password = "password of the setup network here";

#define STX char(0x02)
#define ETX char(0x03)

const char *weatherurl = "api.openweathermap.org";
const char *weatherpath = "/data/2.5/weather?q=Milan,it&lang=en&mode=json&units=metric&APPID=" OPENWEATHERMAP_APIKEY;

const char *dateurl = "api.timezonedb.com";
const char *datepath = "/?zone=Europe/Rome&format=json&key=" TIMEZONEDB_APIKEY;

static const char wday_name[][4] = {
  "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
static const char mon_name[][4] = {
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

void setup() {
  WiFiManager wifiManager;

  Serial.begin(1200);
  delay(10);
  wifiManager.autoConnect(ssid, password);
}

void loop() {
  StaticJsonBuffer<2048> jsonBuffer;
  String json;
  HTTPClient http;

  char date[16];
  char time[16];

  JsonObject& jsonTx = jsonBuffer.createObject();
  JsonObject& weatherTx = jsonTx.createNestedObject("weather");
  JsonObject& dateTx = jsonTx.createNestedObject("date");

  char output[512];

  if (WiFi.status() == WL_CONNECTED) {

    http.begin(weatherurl, 80, weatherpath);

    if (http.GET() == 200) {
      json = http.getString();
      JsonObject& root = jsonBuffer.parseObject(json);

      if (root.success()) {
        weatherTx["weather"] = root["weather"];
        weatherTx["main"] = root["main"];
      }
    }

    http.begin(dateurl, 80, datepath);

    if (http.GET() == 200) {
      json = http.getString();
      JsonObject& root = jsonBuffer.parseObject(json);

      if (root.success()) {
        time_t timestamp = root["timestamp"];
        struct tm *timeptr = localtime(&timestamp);

        sprintf(date, "%s %d %s %d", wday_name[timeptr->tm_wday], timeptr->tm_mday, mon_name[timeptr->tm_mon], 1900 + timeptr->tm_year);
        sprintf(time, "%02d:%02d", timeptr->tm_hour, timeptr->tm_min);

        dateTx["timestamp"] = timestamp;
        dateTx["date"] = date;
        dateTx["time"] = time;
      }
    }

    Serial.print(STX);

    jsonTx.printTo(output, sizeof(output));
    int len = strlen(output);

    for (int i = 0; i < len; i++) {
      Serial.print(output[i]);
  
      if (i % 32 == 0)
        delay(100);   //Don't fill the Arduino RX buffer!
    }

    Serial.print(ETX);

    delay(10000);
  }
  else
    delay(100);

}

