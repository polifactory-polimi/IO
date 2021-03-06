EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP8266
LIBS:ESP8266-adapter-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "IO-ESP8266-adapter"
Date "2016-03-14"
Rev "1.0"
Comp "Nicola Corna"
Comment1 "Copyright 2016 Nicola Corna <nicola@corna.info>"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ESP-01v090 U1
U 1 1 56DEFC8E
P 4150 3500
F 0 "U1" H 4150 3400 50  0000 C CNN
F 1 "ESP-01v090" H 4150 3600 50  0000 C CNN
F 2 "ESP8266:ESP-01" H 4150 3500 50  0001 C CNN
F 3 "" H 4150 3500 50  0001 C CNN
	1    4150 3500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 56DEFCC2
P 5100 3350
F 0 "#PWR01" H 5100 3100 50  0001 C CNN
F 1 "GND" H 5100 3200 50  0000 C CNN
F 2 "" H 5100 3350 50  0000 C CNN
F 3 "" H 5100 3350 50  0000 C CNN
	1    5100 3350
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR02
U 1 1 56DF0EB1
P 3200 3650
F 0 "#PWR02" H 3200 3500 50  0001 C CNN
F 1 "+3.3V" H 3200 3790 50  0000 C CNN
F 2 "" H 3200 3650 50  0000 C CNN
F 3 "" H 3200 3650 50  0000 C CNN
	1    3200 3650
	0    -1   -1   0   
$EndComp
Text GLabel 3200 3350 0    60   Input ~ 0
ESP_TX
Text GLabel 5100 3650 2    60   Input ~ 0
ESP_RX
$Comp
L +3.3V #PWR03
U 1 1 56DF0F96
P 3200 3450
F 0 "#PWR03" H 3200 3300 50  0001 C CNN
F 1 "+3.3V" H 3200 3590 50  0000 C CNN
F 2 "" H 3200 3450 50  0000 C CNN
F 3 "" H 3200 3450 50  0000 C CNN
	1    3200 3450
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 56DF0FB6
P 5250 3450
F 0 "R2" V 5330 3450 50  0000 C CNN
F 1 "22k" V 5250 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5180 3450 50  0001 C CNN
F 3 "" H 5250 3450 50  0000 C CNN
	1    5250 3450
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR04
U 1 1 56DF0FE1
P 5400 3450
F 0 "#PWR04" H 5400 3300 50  0001 C CNN
F 1 "+3.3V" H 5400 3590 50  0000 C CNN
F 2 "" H 5400 3450 50  0000 C CNN
F 3 "" H 5400 3450 50  0000 C CNN
	1    5400 3450
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 56DF1057
P 5850 3400
F 0 "R3" V 5930 3400 50  0000 C CNN
F 1 "22k" V 5850 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 5780 3400 50  0001 C CNN
F 3 "" H 5850 3400 50  0000 C CNN
	1    5850 3400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR05
U 1 1 56DF105D
P 5850 3250
F 0 "#PWR05" H 5850 3100 50  0001 C CNN
F 1 "+3.3V" H 5850 3390 50  0000 C CNN
F 2 "" H 5850 3250 50  0000 C CNN
F 3 "" H 5850 3250 50  0000 C CNN
	1    5850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3550 5850 3550
$Comp
L GND #PWR06
U 1 1 56DF10B0
P 5850 4150
F 0 "#PWR06" H 5850 3900 50  0001 C CNN
F 1 "GND" H 5850 4000 50  0000 C CNN
F 2 "" H 5850 4150 50  0000 C CNN
F 3 "" H 5850 4150 50  0000 C CNN
	1    5850 4150
	1    0    0    -1  
$EndComp
$Comp
L JUMPER JP2
U 1 1 56DF10C5
P 5850 3850
F 0 "JP2" H 5850 4000 50  0000 C CNN
F 1 "JUMPER" H 5850 3770 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5850 3850 50  0001 C CNN
F 3 "" H 5850 3850 50  0000 C CNN
	1    5850 3850
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 56DF11CF
P 2600 3400
F 0 "R1" V 2680 3400 50  0000 C CNN
F 1 "22k" V 2600 3400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 2530 3400 50  0001 C CNN
F 3 "" H 2600 3400 50  0000 C CNN
	1    2600 3400
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 56DF11D5
P 2600 3250
F 0 "#PWR07" H 2600 3100 50  0001 C CNN
F 1 "+3.3V" H 2600 3390 50  0000 C CNN
F 2 "" H 2600 3250 50  0000 C CNN
F 3 "" H 2600 3250 50  0000 C CNN
	1    2600 3250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 3550 2600 3550
$Comp
L GND #PWR08
U 1 1 56DF11DC
P 2600 4150
F 0 "#PWR08" H 2600 3900 50  0001 C CNN
F 1 "GND" H 2600 4000 50  0000 C CNN
F 2 "" H 2600 4150 50  0000 C CNN
F 3 "" H 2600 4150 50  0000 C CNN
	1    2600 4150
	-1   0    0    -1  
$EndComp
$Comp
L JUMPER JP1
U 1 1 56DF11E2
P 2600 3850
F 0 "JP1" H 2600 4000 50  0000 C CNN
F 1 "JUMPER" H 2600 3770 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2600 3850 50  0001 C CNN
F 3 "" H 2600 3850 50  0000 C CNN
	1    2600 3850
	0    -1   1    0   
$EndComp
$Comp
L CONN_01X04 P1
U 1 1 56DF12CE
P 8700 3750
F 0 "P1" H 8700 4000 50  0000 C CNN
F 1 "CONN_01X04" V 8800 3750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 8700 3750 50  0001 C CNN
F 3 "" H 8700 3750 50  0000 C CNN
	1    8700 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 56DF1340
P 8500 3600
F 0 "#PWR09" H 8500 3350 50  0001 C CNN
F 1 "GND" H 8500 3450 50  0000 C CNN
F 2 "" H 8500 3600 50  0000 C CNN
F 3 "" H 8500 3600 50  0000 C CNN
	1    8500 3600
	0    1    1    0   
$EndComp
$Comp
L AP1117 U2
U 1 1 56DF1401
P 6850 2500
F 0 "U2" H 6950 2250 50  0000 C CNN
F 1 "AP1117" H 6850 2750 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-220_Neutral123_Horizontal_LargePads" H 6850 2500 50  0001 C CNN
F 3 "" H 6850 2500 50  0000 C CNN
	1    6850 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 56DF14B9
P 6550 2500
F 0 "#PWR010" H 6550 2350 50  0001 C CNN
F 1 "+5V" H 6550 2640 50  0000 C CNN
F 2 "" H 6550 2500 50  0000 C CNN
F 3 "" H 6550 2500 50  0000 C CNN
	1    6550 2500
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR011
U 1 1 56DF14DF
P 7350 2500
F 0 "#PWR011" H 7350 2350 50  0001 C CNN
F 1 "+3.3V" H 7350 2640 50  0000 C CNN
F 2 "" H 7350 2500 50  0000 C CNN
F 3 "" H 7350 2500 50  0000 C CNN
	1    7350 2500
	0    1    1    0   
$EndComp
$Comp
L GND #PWR012
U 1 1 56DF1505
P 6850 2800
F 0 "#PWR012" H 6850 2550 50  0001 C CNN
F 1 "GND" H 6850 2650 50  0000 C CNN
F 2 "" H 6850 2800 50  0000 C CNN
F 3 "" H 6850 2800 50  0000 C CNN
	1    6850 2800
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR013
U 1 1 56DF15B0
P 8500 3700
F 0 "#PWR013" H 8500 3550 50  0001 C CNN
F 1 "+5V" H 8500 3840 50  0000 C CNN
F 2 "" H 8500 3700 50  0000 C CNN
F 3 "" H 8500 3700 50  0000 C CNN
	1    8500 3700
	0    -1   -1   0   
$EndComp
$Comp
L CP C1
U 1 1 56DF15CF
P 7250 2650
F 0 "C1" H 7275 2750 50  0000 L CNN
F 1 "10u" H 7275 2550 50  0000 L CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 7288 2500 50  0001 C CNN
F 3 "" H 7250 2650 50  0000 C CNN
	1    7250 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2500 7350 2500
Connection ~ 7250 2500
$Comp
L GND #PWR014
U 1 1 56DF16A8
P 7250 2800
F 0 "#PWR014" H 7250 2550 50  0001 C CNN
F 1 "GND" H 7250 2650 50  0000 C CNN
F 2 "" H 7250 2800 50  0000 C CNN
F 3 "" H 7250 2800 50  0000 C CNN
	1    7250 2800
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GSD Q1
U 1 1 56DF16FD
P 7650 3700
F 0 "Q1" V 7550 3900 50  0000 R CNN
F 1 "Q_NMOS_GSD" V 7900 3900 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 7850 3800 50  0001 C CNN
F 3 "" H 7650 3700 50  0000 C CNN
	1    7650 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 3800 8500 3800
$Comp
L R R4
U 1 1 56DF1865
P 7450 3650
F 0 "R4" V 7530 3650 50  0000 C CNN
F 1 "22k" V 7450 3650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7380 3650 50  0001 C CNN
F 3 "" H 7450 3650 50  0000 C CNN
	1    7450 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3500 7650 3500
$Comp
L +3.3V #PWR015
U 1 1 56DF1931
P 7650 3500
F 0 "#PWR015" H 7650 3350 50  0001 C CNN
F 1 "+3.3V" H 7650 3640 50  0000 C CNN
F 2 "" H 7650 3500 50  0000 C CNN
F 3 "" H 7650 3500 50  0000 C CNN
	1    7650 3500
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GSD Q2
U 1 1 56DF19A5
P 7650 4450
F 0 "Q2" V 7550 4650 50  0000 R CNN
F 1 "Q_NMOS_GSD" V 7900 4650 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT-23_Handsoldering" H 7850 4550 50  0001 C CNN
F 3 "" H 7650 4450 50  0000 C CNN
	1    7650 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 4550 8500 4550
$Comp
L R R5
U 1 1 56DF19AC
P 7450 4400
F 0 "R5" V 7530 4400 50  0000 C CNN
F 1 "22k" V 7450 4400 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7380 4400 50  0001 C CNN
F 3 "" H 7450 4400 50  0000 C CNN
	1    7450 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4250 7650 4250
$Comp
L +3.3V #PWR016
U 1 1 56DF19B3
P 7650 4250
F 0 "#PWR016" H 7650 4100 50  0001 C CNN
F 1 "+3.3V" H 7650 4390 50  0000 C CNN
F 2 "" H 7650 4250 50  0000 C CNN
F 3 "" H 7650 4250 50  0000 C CNN
	1    7650 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4550 8500 3900
Text GLabel 7200 3800 0    60   Input ~ 0
ESP_RX
Wire Wire Line
	7200 3800 7450 3800
Text GLabel 7200 4550 0    60   Input ~ 0
ESP_TX
Wire Wire Line
	7200 4550 7450 4550
Text Notes 7050 5150 0    60   ~ 0
Licensed under CERN OHL v.1.2
Text Notes 7050 6350 0    60   ~ 0
Copyright 2016 Nicola Corna <nicola@corna.info>\n\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.2.\n\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.2. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.2 for applicable\nconditions
$EndSCHEMATC
