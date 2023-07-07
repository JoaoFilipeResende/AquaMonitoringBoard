EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 8268 11693 portrait
encoding utf-8
Sheet 1 1
Title "FeedFirst Sensor Board"
Date "2020-11-05"
Rev "2"
Comp "ISEP/LSA/INESCTEC/CRAS"
Comment1 "João Resende (amori@isep.ipp.pt)"
Comment2 "Pedro Barbosa (barbo@isep.ipp.pt)"
Comment3 ""
Comment4 ""
$EndDescr
Text Label 6850 1850 0    50   ~ 0
USART4_TX
Text Label 6850 1950 0    50   ~ 0
USART4_RX
Text Label 6850 2050 0    50   ~ 0
USART2_TX
Text Label 6850 2150 0    50   ~ 0
USART2_RX
Text Label 6850 4250 0    50   ~ 0
USART1_RX
Text Label 5550 3950 2    50   ~ 0
USART3_TX
Text Label 5550 4050 2    50   ~ 0
USART3_RX
Text Label 6850 4150 0    50   ~ 0
USART1_TX
Text Label 6775 6325 1    50   ~ 0
NRST
Text Label 6875 6325 1    50   ~ 0
TMS
Text Label 7075 6325 1    50   ~ 0
TCK
$Comp
L power:GND #PWR032
U 1 1 5E3423BA
P 6975 6075
F 0 "#PWR032" H 6975 5825 50  0001 C CNN
F 1 "GND" H 6980 5902 50  0000 C CNN
F 2 "" H 6975 6075 50  0001 C CNN
F 3 "" H 6975 6075 50  0001 C CNN
	1    6975 6075
	1    0    0    1   
$EndComp
Text Label 6675 6325 1    50   ~ 0
SWO
Wire Wire Line
	7175 6775 7175 6075
$Comp
L MCU_ST_STM32F0:STM32F091RCTx U11
U 1 1 5E39DD50
P 6250 3450
F 0 "U11" H 5700 5200 50  0000 C CNN
F 1 "STM32F091RCT6" H 6700 1700 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 5650 1750 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00115237.pdf" H 6250 3450 50  0001 C CNN
	1    6250 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1650 6450 1225
Wire Wire Line
	6050 1650 6050 1450
Connection ~ 6050 1175
Wire Wire Line
	6050 1175 5950 1175
Wire Wire Line
	6150 1650 6150 1375
Connection ~ 6150 1175
Wire Wire Line
	6150 1175 6050 1175
Connection ~ 6250 1175
Wire Wire Line
	6250 1175 6150 1175
Connection ~ 5950 1175
Text Label 5550 1850 2    50   ~ 0
NRST
Wire Wire Line
	5950 5250 5950 5375
Wire Wire Line
	5950 5375 6050 5375
Wire Wire Line
	6350 5375 6350 5250
Wire Wire Line
	6050 5250 6050 5375
Connection ~ 6050 5375
Wire Wire Line
	6050 5375 6150 5375
Wire Wire Line
	6150 5250 6150 5375
Connection ~ 6150 5375
Wire Wire Line
	6150 5375 6250 5375
Connection ~ 6250 5375
Wire Wire Line
	6250 5375 6350 5375
Wire Wire Line
	6150 5375 6150 5450
Wire Wire Line
	6250 5250 6250 5375
$Comp
L power:GND #PWR030
U 1 1 5E3C43BC
P 6150 5450
F 0 "#PWR030" H 6150 5200 50  0001 C CNN
F 1 "GND" H 6155 5277 50  0000 C CNN
F 2 "" H 6150 5450 50  0001 C CNN
F 3 "" H 6150 5450 50  0001 C CNN
	1    6150 5450
	1    0    0    -1  
$EndComp
Text Label 6850 3150 0    50   ~ 0
TMS
Text Label 6850 3250 0    50   ~ 0
TCK
Text Label 6850 3850 0    50   ~ 0
SWO
$Comp
L power:GND #PWR01
U 1 1 5E3E7CBA
P 750 975
AR Path="/5E3E7CBA" Ref="#PWR01"  Part="1" 
AR Path="/5E34E7FA/5E3E7CBA" Ref="#PWR?"  Part="1" 
F 0 "#PWR01" H 750 725 50  0001 C CNN
F 1 "GND" H 755 802 50  0000 C CNN
F 2 "" H 750 975 50  0001 C CNN
F 3 "" H 750 975 50  0001 C CNN
	1    750  975 
	0    1    1    0   
$EndComp
Text Label 1875 1175 0    50   ~ 0
ISO_VCC_DO
$Comp
L board:EZO_Embedded_Circuit U1
U 1 1 5E3E7CD2
P 1450 1675
AR Path="/5E3E7CD2" Ref="U1"  Part="1" 
AR Path="/5E34E7FA/5E3E7CD2" Ref="U?"  Part="1" 
F 0 "U1" H 1450 1950 39  0000 C CNN
F 1 "EZO_Embedded_Circuit_DO" H 1450 1875 39  0000 C CNN
F 2 "board:EZO_circuit" H 1950 2075 39  0001 C CNN
F 3 "https://www.atlas-scientific.com/product_pages/circuits/ezo_do.html" H 1950 2075 39  0001 C CNN
	1    1450 1675
	1    0    0    -1  
$EndComp
Text Label 1875 775  0    50   ~ 0
ISO_USART1_TX
Text Label 1875 875  0    50   ~ 0
ISO_USART1_RX
Text Label 1150 1575 2    50   ~ 0
ISO_USART1_TX
Text Label 1150 1675 2    50   ~ 0
ISO_USART1_RX
$Comp
L Connector:Conn_Coaxial J?
U 1 1 5E3E7CDF
P 2375 1675
AR Path="/5E34E7FA/5E3E7CDF" Ref="J?"  Part="1" 
AR Path="/5E3E7CDF" Ref="J3"  Part="1" 
F 0 "J3" H 2474 1559 50  0000 L CNN
F 1 "DO" H 2474 1650 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 2375 1675 50  0001 C CNN
F 3 " ~" H 2375 1675 50  0001 C CNN
	1    2375 1675
	1    0    0    1   
$EndComp
Text Label 1800 1775 0    50   ~ 0
ISO_VCC_DO
Wire Wire Line
	1800 1575 1925 1575
Wire Wire Line
	1925 1575 1925 1400
Text Label 1075 775  2    50   ~ 0
USART1_TX
Text Label 1075 875  2    50   ~ 0
USART1_RX
Wire Wire Line
	750  1175 1075 1175
Text Label 1875 2400 0    50   ~ 0
ISO_USART2_TX
Text Label 1875 2800 0    50   ~ 0
Isolated_VCC_pH
Text Label 1875 5250 0    50   ~ 0
Isolated_VCC_EC
Text Label 1875 2500 0    50   ~ 0
ISO_USART2_RX
$Comp
L board:EZO_Inline_Voltage_Isolator U6
U 1 1 5E4131E6
P 1475 2600
AR Path="/5E4131E6" Ref="U6"  Part="1" 
AR Path="/5E34E7FA/5E4131E6" Ref="U?"  Part="1" 
F 0 "U6" H 1475 3025 39  0000 C CNN
F 1 "EZO_Inline_Voltage_Isolator" H 1475 2950 39  0000 C CNN
F 2 "board:EZO_voltage_isolator" H 2525 3150 20  0001 C CNN
F 3 "https://www.atlas-scientific.com/product_pages/circuits/basic-ezo.html" H 2525 3150 20  0001 C CNN
	1    1475 2600
	1    0    0    -1  
$EndComp
Text Label 1875 4850 0    50   ~ 0
ISO_USART4_TX
Text Label 1875 4950 0    50   ~ 0
ISO_USART4_RX
Text Label 1150 3200 2    50   ~ 0
ISO_USART2_TX
Text Label 1150 3300 2    50   ~ 0
ISO_USART2_RX
$Comp
L Connector:Conn_Coaxial J4
U 1 1 5E413200
P 2375 3300
F 0 "J4" H 2474 3184 50  0000 L CNN
F 1 "pH" H 2474 3275 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 2375 3300 50  0001 C CNN
F 3 "" H 2375 3300 50  0001 C CNN
	1    2375 3300
	1    0    0    1   
$EndComp
Text Label 1800 3400 0    50   ~ 0
Isolated_VCC_pH
Wire Wire Line
	1800 3200 1925 3200
Wire Wire Line
	1925 3200 1925 3025
Text Label 1150 4000 2    50   ~ 0
USART3_TX
Text Label 1150 4100 2    50   ~ 0
USART3_RX
$Comp
L Connector:Conn_Coaxial J5
U 1 1 5E41321D
P 2375 4100
F 0 "J5" H 2474 3984 50  0000 L CNN
F 1 "RTD" H 2474 4075 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 2375 4100 50  0001 C CNN
F 3 " ~" H 2375 4100 50  0001 C CNN
	1    2375 4100
	1    0    0    1   
$EndComp
Wire Wire Line
	1800 4000 1925 4000
Wire Wire Line
	1925 4000 1925 3825
Wire Wire Line
	1925 3825 2375 3825
Text Label 1150 5650 2    50   ~ 0
ISO_USART4_TX
Text Label 1150 5750 2    50   ~ 0
ISO_USART4_RX
Text Label 1800 5850 0    50   ~ 0
Isolated_VCC_EC
Wire Wire Line
	1800 5650 1925 5650
Wire Wire Line
	1925 5650 1925 5475
Text Label 1075 2400 2    50   ~ 0
USART2_TX
Text Label 1075 2500 2    50   ~ 0
USART2_RX
$Comp
L power:GND #PWR05
U 1 1 5E42FE01
P 750 5050
AR Path="/5E42FE01" Ref="#PWR05"  Part="1" 
AR Path="/5E34E7FA/5E42FE01" Ref="#PWR?"  Part="1" 
F 0 "#PWR05" H 750 4800 50  0001 C CNN
F 1 "GND" H 755 4877 50  0000 C CNN
F 2 "" H 750 5050 50  0001 C CNN
F 3 "" H 750 5050 50  0001 C CNN
	1    750  5050
	0    1    1    0   
$EndComp
Text Label 1075 4850 2    50   ~ 0
USART4_TX
Text Label 1075 4950 2    50   ~ 0
USART4_RX
Wire Wire Line
	750  5250 1075 5250
$Comp
L Device:R_Small R4
U 1 1 5E38A9B3
P 1950 6675
F 0 "R4" V 1875 6675 50  0000 C CNN
F 1 "1K" V 1950 6675 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1950 6675 50  0001 C CNN
F 3 "~" H 1950 6675 50  0001 C CNN
	1    1950 6675
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5E38AAD0
P 1950 7175
F 0 "R5" V 1875 7175 50  0000 C CNN
F 1 "2K" V 1950 7175 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1950 7175 50  0001 C CNN
F 3 "~" H 1950 7175 50  0001 C CNN
	1    1950 7175
	-1   0    0    1   
$EndComp
Wire Wire Line
	1950 6500 1950 6575
$Comp
L power:GND #PWR014
U 1 1 5E39C414
P 1950 7375
F 0 "#PWR014" H 1950 7125 50  0001 C CNN
F 1 "GND" H 1955 7202 50  0000 C CNN
F 2 "" H 1950 7375 50  0001 C CNN
F 3 "" H 1950 7375 50  0001 C CNN
	1    1950 7375
	1    0    0    -1  
$EndComp
Text Label 5550 4750 2    50   ~ 0
USART5_TX
Text Label 5550 3350 2    50   ~ 0
USART5_RX
$Comp
L Device:C_Small C4
U 1 1 5E42BDB0
P 3700 9375
F 0 "C4" H 3792 9421 50  0000 L CNN
F 1 "10uF" H 3792 9330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3700 9375 50  0001 C CNN
F 3 "~" H 3700 9375 50  0001 C CNN
	1    3700 9375
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 9150 3700 9275
Wire Wire Line
	3700 9150 3525 9150
Connection ~ 3700 9150
Wire Wire Line
	3700 9475 3700 9600
Wire Wire Line
	3700 9600 4325 9600
Wire Wire Line
	4325 9600 4800 9600
Wire Wire Line
	4800 9600 4800 9475
Connection ~ 4325 9600
Wire Wire Line
	4625 9150 4800 9150
Wire Wire Line
	4800 9150 4925 9150
Connection ~ 4800 9150
$Comp
L Device:C_Small C12
U 1 1 5E45BE3C
P 4800 9375
F 0 "C12" H 4892 9421 50  0000 L CNN
F 1 "10uF" H 4892 9330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4800 9375 50  0001 C CNN
F 3 "~" H 4800 9375 50  0001 C CNN
	1    4800 9375
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 9150 4800 9275
Wire Wire Line
	3525 9150 3525 9075
$Comp
L power:GND #PWR024
U 1 1 5E475224
P 4325 9675
F 0 "#PWR024" H 4325 9425 50  0001 C CNN
F 1 "GND" H 4330 9502 50  0000 C CNN
F 2 "" H 4325 9675 50  0001 C CNN
F 3 "" H 4325 9675 50  0001 C CNN
	1    4325 9675
	1    0    0    -1  
$EndComp
Wire Wire Line
	4325 9675 4325 9600
$Comp
L power:+3.3V #PWR025
U 1 1 5E47BA77
P 4925 9100
F 0 "#PWR025" H 4925 8950 50  0001 C CNN
F 1 "+3.3V" H 4940 9273 50  0000 C CNN
F 2 "" H 4925 9100 50  0001 C CNN
F 3 "" H 4925 9100 50  0001 C CNN
	1    4925 9100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4925 9100 4925 9150
Wire Wire Line
	2075 6925 1950 6925
$Comp
L power:GND #PWR010
U 1 1 5E3D48F1
P 975 4200
AR Path="/5E3D48F1" Ref="#PWR010"  Part="1" 
AR Path="/5E34E7FA/5E3D48F1" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 975 3950 50  0001 C CNN
F 1 "GND" H 980 4027 50  0000 C CNN
F 2 "" H 975 4200 50  0001 C CNN
F 3 "" H 975 4200 50  0001 C CNN
	1    975  4200
	0    1    1    0   
$EndComp
NoConn ~ 1075 5150
NoConn ~ 1875 5150
NoConn ~ 1875 2700
NoConn ~ 1075 2700
NoConn ~ 1075 1075
NoConn ~ 1875 1075
NoConn ~ 6850 2350
NoConn ~ 6850 2450
NoConn ~ 6850 2550
NoConn ~ 6850 2950
NoConn ~ 6850 3050
NoConn ~ 6850 3350
NoConn ~ 6850 3550
NoConn ~ 6850 3650
NoConn ~ 6850 3750
NoConn ~ 6850 3950
NoConn ~ 6850 4050
NoConn ~ 6850 4350
NoConn ~ 6850 4450
NoConn ~ 6850 4550
NoConn ~ 6850 4650
NoConn ~ 6850 4750
NoConn ~ 6850 4850
NoConn ~ 6850 4950
NoConn ~ 6850 5050
NoConn ~ 5550 5050
NoConn ~ 5550 4950
NoConn ~ 5550 4850
NoConn ~ 5550 4650
NoConn ~ 5550 4550
NoConn ~ 5550 4450
NoConn ~ 5550 4350
NoConn ~ 5550 4250
NoConn ~ 5550 4150
NoConn ~ 5550 3850
NoConn ~ 5550 3750
NoConn ~ 5550 3650
NoConn ~ 5550 3550
$Comp
L power:+3.3V #PWR033
U 1 1 5E7ABA3D
P 7175 6075
F 0 "#PWR033" H 7175 5925 50  0001 C CNN
F 1 "+3.3V" H 7190 6248 50  0000 C CNN
F 2 "" H 7175 6075 50  0001 C CNN
F 3 "" H 7175 6075 50  0001 C CNN
	1    7175 6075
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5EEB38C9
P 1150 10450
F 0 "R1" V 1075 10450 50  0000 C CNN
F 1 "1K" V 1150 10450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1150 10450 50  0001 C CNN
F 3 "~" H 1150 10450 50  0001 C CNN
	1    1150 10450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5EEB3CCD
P 1150 10650
F 0 "R2" V 1075 10650 50  0000 C CNN
F 1 "1K" V 1150 10650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1150 10650 50  0001 C CNN
F 3 "~" H 1150 10650 50  0001 C CNN
	1    1150 10650
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 10650 950  10650
Wire Wire Line
	1250 10650 1325 10650
Wire Wire Line
	1250 10850 1325 10850
Wire Wire Line
	1250 10450 1325 10450
Wire Wire Line
	1050 10450 950  10450
Wire Wire Line
	1050 10850 950  10850
$Comp
L Device:R_Small R3
U 1 1 5EEB3F74
P 1150 10850
F 0 "R3" V 1075 10850 50  0000 C CNN
F 1 "1K" V 1150 10850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1150 10850 50  0001 C CNN
F 3 "~" H 1150 10850 50  0001 C CNN
	1    1150 10850
	0    1    1    0   
$EndComp
Text Label 6850 2650 0    50   ~ 0
LED_RED
Text Label 6850 2750 0    50   ~ 0
LED_GREEN
Text Label 6850 2850 0    50   ~ 0
LED_BLUE
Text Label 950  10450 2    50   ~ 0
LED_RED
Text Label 950  10650 2    50   ~ 0
LED_GREEN
Text Label 950  10850 2    50   ~ 0
LED_BLUE
Wire Wire Line
	6675 6325 6675 6500
NoConn ~ 5550 3150
Text Label 1875 975  0    50   ~ 0
ISO_GND_DO
Text Label 1150 1775 2    50   ~ 0
ISO_GND_DO
Text Label 1150 3400 2    50   ~ 0
Isolated_GND_pH
Text Label 1875 2600 0    50   ~ 0
Isolated_GND_pH
Text Label 1150 5850 2    50   ~ 0
Isolated_GND_EC
Text Label 1875 5050 0    50   ~ 0
Isolated_GND_EC
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 5EF18598
P 900 7550
F 0 "J1" V 773 7730 50  0000 L CNN
F 1 "TURBIDITY" V 864 7730 50  0000 L CNN
F 2 "Connector_JST:JST_GH_SM03B-GHS-TB_1x03-1MP_P1.25mm_Horizontal" H 900 7550 50  0001 C CNN
F 3 "~" H 900 7550 50  0001 C CNN
	1    900  7550
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5EF195C3
P 800 6750
F 0 "#PWR07" H 800 6600 50  0001 C CNN
F 1 "+5V" H 815 6923 50  0000 C CNN
F 2 "" H 800 6750 50  0001 C CNN
F 3 "" H 800 6750 50  0001 C CNN
	1    800  6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5EF5BD0F
P 1000 6750
F 0 "#PWR011" H 1000 6500 50  0001 C CNN
F 1 "GND" H 1005 6577 50  0000 C CNN
F 2 "" H 1000 6750 50  0001 C CNN
F 3 "" H 1000 6750 50  0001 C CNN
	1    1000 6750
	-1   0    0    1   
$EndComp
Text Label 1950 6500 2    50   ~ 0
Turbidity_BRD
Wire Wire Line
	900  7225 900  7350
Wire Wire Line
	1950 7275 1950 7375
$Comp
L power:GND #PWR026
U 1 1 5E3BBAC5
P 4950 3000
F 0 "#PWR026" H 4950 2750 50  0001 C CNN
F 1 "GND" H 4955 2827 50  0000 C CNN
F 2 "" H 4950 3000 50  0001 C CNN
F 3 "" H 4950 3000 50  0001 C CNN
	1    4950 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 3000 4950 3000
$Comp
L Device:Crystal_GND24 Y1
U 1 1 5E3B24DD
P 4700 3000
F 0 "Y1" V 4800 3150 50  0000 L CNN
F 1 "12MHz" V 4700 2900 39  0000 L CNN
F 2 "Crystal:Crystal_SMD_Abracon_ABM8G-4Pin_3.2x2.5mm" H 4700 3000 50  0001 C CNN
F 3 "https://abracon.com/Resonators/ABM8G.pdf" H 4700 3000 50  0001 C CNN
	1    4700 3000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5E33703A
P 4175 3000
F 0 "#PWR023" H 4175 2750 50  0001 C CNN
F 1 "GND" H 4180 2827 50  0000 C CNN
F 2 "" H 4175 3000 50  0001 C CNN
F 3 "" H 4175 3000 50  0001 C CNN
	1    4175 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 3000 4250 3150
Connection ~ 4250 3000
Wire Wire Line
	4250 3150 4350 3150
Wire Wire Line
	4250 2850 4250 3000
Wire Wire Line
	4350 2850 4250 2850
$Comp
L Device:C_Small C9
U 1 1 5E336FDC
P 4450 3150
AR Path="/5E336FDC" Ref="C9"  Part="1" 
AR Path="/5E336AFC/5E336FDC" Ref="C?"  Part="1" 
F 0 "C9" V 4575 3050 50  0000 L CNN
F 1 "10pF" V 4650 3050 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4450 3150 50  0001 C CNN
F 3 "~" H 4450 3150 50  0001 C CNN
	1    4450 3150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5E383E10
P 3825 1925
F 0 "#PWR020" H 3825 1675 50  0001 C CNN
F 1 "GND" H 3830 1752 50  0000 C CNN
F 2 "" H 3825 1925 50  0001 C CNN
F 3 "" H 3825 1925 50  0001 C CNN
	1    3825 1925
	1    0    0    -1  
$EndComp
Connection ~ 3825 1875
Wire Wire Line
	3825 1875 3825 1925
Wire Wire Line
	4800 1450 4800 1550
Wire Wire Line
	4475 1875 4800 1875
Connection ~ 4475 1875
Wire Wire Line
	4475 1750 4475 1875
Wire Wire Line
	4150 1875 4475 1875
Connection ~ 4150 1875
Wire Wire Line
	4150 1750 4150 1875
Wire Wire Line
	4800 1875 4800 1750
Wire Wire Line
	3825 1875 4150 1875
Wire Wire Line
	3825 1750 3825 1875
$Comp
L Device:C_Small C11
U 1 1 5E381100
P 4800 1650
F 0 "C11" H 4825 1725 50  0000 L CNN
F 1 "0.1uF" H 4825 1575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4800 1650 50  0001 C CNN
F 3 "~" H 4800 1650 50  0001 C CNN
	1    4800 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5E380D56
P 4475 1650
F 0 "C10" H 4500 1725 50  0000 L CNN
F 1 "0.1uF" H 4500 1575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4475 1650 50  0001 C CNN
F 3 "~" H 4475 1650 50  0001 C CNN
	1    4475 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5E380D1A
P 4150 1650
F 0 "C7" H 4175 1725 50  0000 L CNN
F 1 "0.1uF" H 4175 1575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4150 1650 50  0001 C CNN
F 3 "~" H 4150 1650 50  0001 C CNN
	1    4150 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5E380B63
P 3825 1650
F 0 "C5" H 3850 1725 50  0000 L CNN
F 1 "0.1uF" H 3850 1575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3825 1650 50  0001 C CNN
F 3 "~" H 3825 1650 50  0001 C CNN
F 4 "C" H 3825 1650 50  0001 C CNN "Spice_Primitive"
F 5 "0.1u" H 3825 1650 50  0001 C CNN "Spice_Model"
F 6 "Y" H 3825 1650 50  0001 C CNN "Spice_Netlist_Enabled"
	1    3825 1650
	1    0    0    -1  
$EndComp
Text Label 900  7225 1    50   ~ 0
Turbidity_BRD
$Comp
L power:+3.3V #PWR02
U 1 1 5FA04B6D
P 750 1175
F 0 "#PWR02" H 750 1025 50  0001 C CNN
F 1 "+3.3V" H 765 1348 50  0000 C CNN
F 2 "" H 750 1175 50  0001 C CNN
F 3 "" H 750 1175 50  0001 C CNN
	1    750  1175
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR04
U 1 1 5FA05765
P 750 2800
F 0 "#PWR04" H 750 2650 50  0001 C CNN
F 1 "+3.3V" H 765 2973 50  0000 C CNN
F 2 "" H 750 2800 50  0001 C CNN
F 3 "" H 750 2800 50  0001 C CNN
	1    750  2800
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR015
U 1 1 5FA05E1F
P 1975 4200
F 0 "#PWR015" H 1975 4050 50  0001 C CNN
F 1 "+3.3V" H 1990 4373 50  0000 C CNN
F 2 "" H 1975 4200 50  0001 C CNN
F 3 "" H 1975 4200 50  0001 C CNN
	1    1975 4200
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR06
U 1 1 5FA06F6C
P 750 5250
F 0 "#PWR06" H 750 5100 50  0001 C CNN
F 1 "+3.3V" H 765 5423 50  0000 C CNN
F 2 "" H 750 5250 50  0001 C CNN
F 3 "" H 750 5250 50  0001 C CNN
	1    750  5250
	0    -1   -1   0   
$EndComp
$Comp
L Interface_UART:MAX232 U9
U 1 1 5FA390B7
P 4050 6875
F 0 "U9" H 4550 7950 50  0000 C CNN
F 1 "MAX3232CPWR" H 4500 5800 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 4100 5825 50  0001 L CNN
F 3 "https://www.ti.com/lit/ds/symlink/max3232.pdf" H 4050 6975 50  0001 C CNN
	1    4050 6875
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5FA3B7C4
P 3250 6125
AR Path="/5FA3B7C4" Ref="C3"  Part="1" 
AR Path="/5E336AFC/5FA3B7C4" Ref="C?"  Part="1" 
F 0 "C3" H 2925 6175 50  0000 L CNN
F 1 "0.1uF" H 2925 6100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3250 6125 50  0001 C CNN
F 3 "~" H 3250 6125 50  0001 C CNN
	1    3250 6125
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 6025 3250 5975
Wire Wire Line
	3250 6225 3250 6275
$Comp
L Device:C_Small C13
U 1 1 5FA481A1
P 4850 6125
AR Path="/5FA481A1" Ref="C13"  Part="1" 
AR Path="/5E336AFC/5FA481A1" Ref="C?"  Part="1" 
F 0 "C13" H 4942 6171 50  0000 L CNN
F 1 "0.1uF" H 4950 6100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4850 6125 50  0001 C CNN
F 3 "~" H 4850 6125 50  0001 C CNN
	1    4850 6125
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 6025 4850 5975
Wire Wire Line
	4850 6225 4850 6275
$Comp
L Device:C_Small C14
U 1 1 5FA54755
P 5000 6475
AR Path="/5FA54755" Ref="C14"  Part="1" 
AR Path="/5E336AFC/5FA54755" Ref="C?"  Part="1" 
F 0 "C14" V 4825 6400 50  0000 L CNN
F 1 "0.1uF" V 4900 6400 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5000 6475 50  0001 C CNN
F 3 "~" H 5000 6475 50  0001 C CNN
	1    5000 6475
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 6475 4900 6475
$Comp
L Device:C_Small C15
U 1 1 5FA5ADEC
P 5025 6775
AR Path="/5FA5ADEC" Ref="C15"  Part="1" 
AR Path="/5E336AFC/5FA5ADEC" Ref="C?"  Part="1" 
F 0 "C15" V 4850 6675 50  0000 L CNN
F 1 "0.1uF" V 4925 6675 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5025 6775 50  0001 C CNN
F 3 "~" H 5025 6775 50  0001 C CNN
	1    5025 6775
	0    1    1    0   
$EndComp
Wire Wire Line
	4925 6775 4850 6775
Wire Wire Line
	5100 6475 5200 6475
Wire Wire Line
	5200 6775 5125 6775
$Comp
L Device:C_Small C6
U 1 1 5FA67A1D
P 3825 5500
AR Path="/5FA67A1D" Ref="C6"  Part="1" 
AR Path="/5E336AFC/5FA67A1D" Ref="C?"  Part="1" 
F 0 "C6" V 3650 5375 50  0000 L CNN
F 1 "0.1uF" V 3725 5375 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3825 5500 50  0001 C CNN
F 3 "~" H 3825 5500 50  0001 C CNN
	1    3825 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	4050 5675 4050 5500
Wire Wire Line
	4050 5500 3925 5500
$Comp
L power:GND #PWR019
U 1 1 5FA6F287
P 3600 5525
AR Path="/5FA6F287" Ref="#PWR019"  Part="1" 
AR Path="/5E34E7FA/5FA6F287" Ref="#PWR?"  Part="1" 
F 0 "#PWR019" H 3600 5275 50  0001 C CNN
F 1 "GND" H 3605 5352 50  0000 C CNN
F 2 "" H 3600 5525 50  0001 C CNN
F 3 "" H 3600 5525 50  0001 C CNN
	1    3600 5525
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5525 3600 5500
Wire Wire Line
	3600 5500 3725 5500
Connection ~ 4050 5500
Wire Wire Line
	4050 5400 4050 5500
$Comp
L power:GND #PWR027
U 1 1 5FA838BC
P 5200 6625
AR Path="/5FA838BC" Ref="#PWR027"  Part="1" 
AR Path="/5E34E7FA/5FA838BC" Ref="#PWR?"  Part="1" 
F 0 "#PWR027" H 5200 6375 50  0001 C CNN
F 1 "GND" H 5205 6452 50  0000 C CNN
F 2 "" H 5200 6625 50  0001 C CNN
F 3 "" H 5200 6625 50  0001 C CNN
	1    5200 6625
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5FA848DF
P 4050 8075
AR Path="/5FA848DF" Ref="#PWR022"  Part="1" 
AR Path="/5E34E7FA/5FA848DF" Ref="#PWR?"  Part="1" 
F 0 "#PWR022" H 4050 7825 50  0001 C CNN
F 1 "GND" H 4055 7902 50  0000 C CNN
F 2 "" H 4050 8075 50  0001 C CNN
F 3 "" H 4050 8075 50  0001 C CNN
	1    4050 8075
	1    0    0    -1  
$EndComp
NoConn ~ 3250 7175
NoConn ~ 3250 7575
NoConn ~ 4850 7175
NoConn ~ 4850 7575
Text Label 3250 7375 2    50   ~ 0
USART5_RX
Text Label 3250 6975 2    50   ~ 0
USART5_TX
Text Label 4850 6975 0    50   ~ 0
RS232_TX
Text Label 4850 7375 0    50   ~ 0
RS232_RX
Wire Wire Line
	7075 6325 7075 6775
Wire Wire Line
	6875 6325 6875 6775
Wire Wire Line
	6775 6325 6775 6775
Wire Wire Line
	6250 1175 6450 1175
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5FA2B2F7
P 900 9450
F 0 "J2" V 772 9530 50  0000 L CNN
F 1 "PWR" V 863 9530 50  0000 L CNN
F 2 "Connector_Molex:Molex_SPOX_5268-02A_1x02_P2.50mm_Horizontal" H 900 9450 50  0001 C CNN
F 3 "~" H 900 9450 50  0001 C CNN
	1    900  9450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5FA2BC7E
P 900 9175
F 0 "#PWR09" H 900 8925 50  0001 C CNN
F 1 "GND" H 905 9002 50  0000 C CNN
F 2 "" H 900 9175 50  0001 C CNN
F 3 "" H 900 9175 50  0001 C CNN
	1    900  9175
	-1   0    0    1   
$EndComp
Wire Wire Line
	900  9175 900  9250
$Comp
L power:+12V #PWR08
U 1 1 5FA4C2C5
P 800 9050
F 0 "#PWR08" H 800 8900 50  0001 C CNN
F 1 "+12V" H 815 9223 50  0000 C CNN
F 2 "" H 800 9050 50  0001 C CNN
F 3 "" H 800 9050 50  0001 C CNN
	1    800  9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 9150 4025 9150
Wire Wire Line
	4325 9450 4325 9600
$Comp
L Device:C_Small C1
U 1 1 5FAA52FD
P 1825 9375
F 0 "C1" H 1917 9421 50  0000 L CNN
F 1 "10uF" H 1917 9330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1825 9375 50  0001 C CNN
F 3 "~" H 1825 9375 50  0001 C CNN
	1    1825 9375
	1    0    0    -1  
$EndComp
Wire Wire Line
	1825 9150 1825 9275
Wire Wire Line
	1825 9150 1650 9150
Connection ~ 1825 9150
Wire Wire Line
	1825 9475 1825 9600
Wire Wire Line
	1825 9600 2450 9600
Wire Wire Line
	2450 9600 2925 9600
Wire Wire Line
	2925 9600 2925 9475
Connection ~ 2450 9600
Wire Wire Line
	2750 9150 2925 9150
Wire Wire Line
	2925 9150 3050 9150
Connection ~ 2925 9150
$Comp
L Device:C_Small C2
U 1 1 5FAA530E
P 2925 9375
F 0 "C2" H 3017 9421 50  0000 L CNN
F 1 "10uF" H 3017 9330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2925 9375 50  0001 C CNN
F 3 "~" H 2925 9375 50  0001 C CNN
	1    2925 9375
	1    0    0    -1  
$EndComp
Wire Wire Line
	2925 9150 2925 9275
Wire Wire Line
	1650 9150 1650 9075
$Comp
L power:GND #PWR016
U 1 1 5FAA5316
P 2450 9675
F 0 "#PWR016" H 2450 9425 50  0001 C CNN
F 1 "GND" H 2455 9502 50  0000 C CNN
F 2 "" H 2450 9675 50  0001 C CNN
F 3 "" H 2450 9675 50  0001 C CNN
	1    2450 9675
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 9675 2450 9600
Wire Wire Line
	3050 9100 3050 9150
Wire Wire Line
	1825 9150 2150 9150
Wire Wire Line
	2450 9450 2450 9600
$Comp
L power:+12V #PWR012
U 1 1 5FAA532C
P 1650 9075
F 0 "#PWR012" H 1650 8925 50  0001 C CNN
F 1 "+12V" H 1665 9248 50  0000 C CNN
F 2 "" H 1650 9075 50  0001 C CNN
F 3 "" H 1650 9075 50  0001 C CNN
	1    1650 9075
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5FAABD8E
P 3050 9100
F 0 "#PWR017" H 3050 8950 50  0001 C CNN
F 1 "+5V" H 3065 9273 50  0000 C CNN
F 2 "" H 3050 9100 50  0001 C CNN
F 3 "" H 3050 9100 50  0001 C CNN
	1    3050 9100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 5FAACE90
P 3525 9075
F 0 "#PWR018" H 3525 8925 50  0001 C CNN
F 1 "+5V" H 3540 9248 50  0000 C CNN
F 2 "" H 3525 9075 50  0001 C CNN
F 3 "" H 3525 9075 50  0001 C CNN
	1    3525 9075
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM1117-5.0 U8
U 1 1 5FAAEBC3
P 2450 9150
F 0 "U8" H 2450 9392 50  0000 C CNN
F 1 "LM1117-5.0" H 2450 9301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2450 9150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 2450 9150 50  0001 C CNN
	1    2450 9150
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM1117-3.3 U10
U 1 1 5FAAFC3E
P 4325 9150
F 0 "U10" H 4325 9392 50  0000 C CNN
F 1 "LM1117-3.3" H 4325 9301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4325 9150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 4325 9150 50  0001 C CNN
	1    4325 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 6075 6975 6775
$Comp
L Device:R_Small R6
U 1 1 5FAB0D83
P 6675 6600
F 0 "R6" V 6600 6600 50  0000 C CNN
F 1 "0R" V 6675 6600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6675 6600 50  0001 C CNN
F 3 "~" H 6675 6600 50  0001 C CNN
	1    6675 6600
	1    0    0    1   
$EndComp
Wire Wire Line
	6675 6700 6675 6775
Wire Wire Line
	800  7350 800  6750
Wire Wire Line
	1000 7350 1000 6750
Wire Wire Line
	1950 6775 1950 6925
Connection ~ 1950 6925
Wire Wire Line
	1950 6925 1950 7075
Wire Wire Line
	750  975  1075 975 
Wire Wire Line
	750  2800 1075 2800
Wire Wire Line
	750  2600 1075 2600
$Comp
L power:GND #PWR03
U 1 1 5E41B609
P 750 2600
AR Path="/5E41B609" Ref="#PWR03"  Part="1" 
AR Path="/5E34E7FA/5E41B609" Ref="#PWR?"  Part="1" 
F 0 "#PWR03" H 750 2350 50  0001 C CNN
F 1 "GND" H 755 2427 50  0000 C CNN
F 2 "" H 750 2600 50  0001 C CNN
F 3 "" H 750 2600 50  0001 C CNN
	1    750  2600
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 1675 2175 1675
Wire Wire Line
	2375 1475 2375 1400
Wire Wire Line
	1925 1400 2375 1400
Wire Wire Line
	1800 3300 2175 3300
Wire Wire Line
	2375 3025 2375 3100
Wire Wire Line
	1800 4100 2175 4100
Wire Wire Line
	2375 3825 2375 3900
Wire Wire Line
	1975 4200 1800 4200
Wire Wire Line
	1150 4200 975  4200
Wire Wire Line
	750  5050 1075 5050
Wire Wire Line
	1800 5750 2175 5750
$Comp
L Connector:Conn_Coaxial J6
U 1 1 5E41323A
P 2375 5750
F 0 "J6" H 2475 5634 50  0000 L CNN
F 1 "EC" H 2475 5725 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 2375 5750 50  0001 C CNN
F 3 " ~" H 2375 5750 50  0001 C CNN
	1    2375 5750
	1    0    0    1   
$EndComp
Wire Wire Line
	2375 5550 2375 5475
Wire Wire Line
	2375 5475 1925 5475
Wire Wire Line
	1925 3025 2375 3025
Wire Wire Line
	6350 700  6350 825 
$Comp
L Device:L_Small L1
U 1 1 5E5AA7A5
P 6350 925
F 0 "L1" H 6397 971 50  0000 L CNN
F 1 "600R,350mA" H 6397 880 50  0000 L CNN
F 2 "Inductor_SMD:L_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6350 925 50  0001 C CNN
F 3 "~" H 6350 925 50  0001 C CNN
	1    6350 925 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR031
U 1 1 5E5AA37B
P 6350 700
F 0 "#PWR031" H 6350 550 50  0001 C CNN
F 1 "+3.3V" H 6365 873 50  0000 C CNN
F 2 "" H 6350 700 50  0001 C CNN
F 3 "" H 6350 700 50  0001 C CNN
	1    6350 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 700  5950 1175
$Comp
L power:+3.3V #PWR028
U 1 1 5E3A85C3
P 5950 700
F 0 "#PWR028" H 5950 550 50  0001 C CNN
F 1 "+3.3V" H 5965 873 50  0000 C CNN
F 2 "" H 5950 700 50  0001 C CNN
F 3 "" H 5950 700 50  0001 C CNN
	1    5950 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3825 1225 3825 1550
Connection ~ 6450 1225
Wire Wire Line
	6450 1225 6450 1175
Wire Wire Line
	4150 1300 4150 1550
Wire Wire Line
	4475 1375 4475 1550
Wire Wire Line
	6350 1025 6350 1650
Wire Wire Line
	6250 1175 6250 1300
Wire Wire Line
	4150 1300 6250 1300
Connection ~ 6250 1300
Wire Wire Line
	6250 1300 6250 1650
Wire Wire Line
	4475 1375 6150 1375
Connection ~ 6150 1375
Wire Wire Line
	6150 1375 6150 1175
$Comp
L Device:C_Small C16
U 1 1 5FCE23B0
P 5125 1650
F 0 "C16" H 5150 1725 50  0000 L CNN
F 1 "0.1uF" H 5150 1575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5125 1650 50  0001 C CNN
F 3 "~" H 5125 1650 50  0001 C CNN
	1    5125 1650
	1    0    0    -1  
$EndComp
Connection ~ 6050 1450
Wire Wire Line
	6050 1450 6050 1175
Wire Wire Line
	4800 1450 6050 1450
Wire Wire Line
	5950 1175 5950 1525
Wire Wire Line
	5950 1525 5125 1525
Wire Wire Line
	5125 1525 5125 1550
Connection ~ 5950 1525
Wire Wire Line
	5950 1525 5950 1650
Wire Wire Line
	5125 1750 5125 1875
Wire Wire Line
	5125 1875 4800 1875
Connection ~ 4800 1875
Wire Wire Line
	5425 3150 5425 3050
Wire Wire Line
	5425 3050 5550 3050
Wire Wire Line
	5425 2850 5425 2950
Wire Wire Line
	5425 2950 5550 2950
Wire Wire Line
	4250 3000 4175 3000
Wire Wire Line
	4250 3000 4500 3000
$Comp
L Device:C_Small C8
U 1 1 5E336FD5
P 4450 2850
AR Path="/5E336FD5" Ref="C8"  Part="1" 
AR Path="/5E336AFC/5E336FD5" Ref="C?"  Part="1" 
F 0 "C8" V 4250 2950 50  0000 R CNN
F 1 "10pF" V 4325 2950 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4450 2850 50  0001 C CNN
F 3 "~" H 4450 2850 50  0001 C CNN
	1    4450 2850
	0    -1   1    0   
$EndComp
$Comp
L power:+3.3V #PWR021
U 1 1 5FDE0774
P 4050 5400
F 0 "#PWR021" H 4050 5250 50  0001 C CNN
F 1 "+3.3V" H 4065 5573 50  0000 C CNN
F 2 "" H 4050 5400 50  0001 C CNN
F 3 "" H 4050 5400 50  0001 C CNN
	1    4050 5400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5FACF9EC
P 6200 8300
F 0 "J7" V 6073 8480 50  0000 L CNN
F 1 "COM1" V 6164 8480 50  0000 L CNN
F 2 "Connector_Molex:Molex_SPOX_5268-03A_1x03_P2.50mm_Horizontal" H 6200 8300 50  0001 C CNN
F 3 "~" H 6200 8300 50  0001 C CNN
	1    6200 8300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5FAA02B1
P 6100 7775
AR Path="/5FAA02B1" Ref="#PWR029"  Part="1" 
AR Path="/5E34E7FA/5FAA02B1" Ref="#PWR?"  Part="1" 
F 0 "#PWR029" H 6100 7525 50  0001 C CNN
F 1 "GND" H 6105 7602 50  0000 C CNN
F 2 "" H 6100 7775 50  0001 C CNN
F 3 "" H 6100 7775 50  0001 C CNN
	1    6100 7775
	-1   0    0    1   
$EndComp
Text Label 6200 8100 1    50   ~ 0
RS232_TX
Text Label 6300 8100 1    50   ~ 0
RS232_RX
Wire Wire Line
	6100 7775 6100 8100
$Comp
L Connector_Generic:Conn_01x06 J8
U 1 1 5FE08166
P 6975 6975
F 0 "J8" V 6847 7255 50  0000 L CNN
F 1 "PROGRAMMER" V 6938 7255 50  0000 L CNN
F 2 "Connector_JST:JST_GH_SM06B-GHS-TB_1x06-1MP_P1.25mm_Horizontal" H 6975 6975 50  0001 C CNN
F 3 "~" H 6975 6975 50  0001 C CNN
	1    6975 6975
	0    1    1    0   
$EndComp
Wire Wire Line
	800  9050 800  9250
$Comp
L board:EZO_Embedded_Circuit U2
U 1 1 5E4131F7
P 1450 3300
AR Path="/5E4131F7" Ref="U2"  Part="1" 
AR Path="/5E34E7FA/5E4131F7" Ref="U?"  Part="1" 
F 0 "U2" H 1450 3575 39  0000 C CNN
F 1 "EZO_Embedded_Circuit_pH" H 1450 3500 39  0000 C CNN
F 2 "board:EZO_circuit" H 1950 3700 39  0001 C CNN
F 3 "https://www.atlas-scientific.com/product_pages/circuits/ezo_ph.html" H 1950 3700 39  0001 C CNN
	1    1450 3300
	1    0    0    -1  
$EndComp
$Comp
L board:EZO_Inline_Voltage_Isolator U7
U 1 1 5E4131DA
P 1475 5050
AR Path="/5E4131DA" Ref="U7"  Part="1" 
AR Path="/5E34E7FA/5E4131DA" Ref="U?"  Part="1" 
F 0 "U7" H 1475 5475 39  0000 C CNN
F 1 "EZO_Inline_Voltage_Isolator" H 1475 5400 39  0000 C CNN
F 2 "board:EZO_voltage_isolator" H 2525 5600 20  0001 C CNN
F 3 "https://www.atlas-scientific.com/product_pages/circuits/basic-ezo.html" H 2525 5600 20  0001 C CNN
	1    1475 5050
	1    0    0    -1  
$EndComp
$Comp
L board:EZO_Embedded_Circuit U4
U 1 1 5E413231
P 1450 5750
AR Path="/5E413231" Ref="U4"  Part="1" 
AR Path="/5E34E7FA/5E413231" Ref="U?"  Part="1" 
F 0 "U4" H 1450 6025 39  0000 C CNN
F 1 "EZO_Embedded_Circuit_EC" H 1450 5950 39  0000 C CNN
F 2 "board:EZO_circuit" H 1950 6150 39  0001 C CNN
F 3 "https://www.atlas-scientific.com/product_pages/circuits/ezo_ec.html" H 1950 6150 39  0001 C CNN
	1    1450 5750
	1    0    0    -1  
$EndComp
Text Label 6850 2250 0    50   ~ 0
ADC_IN4
Text Label 2075 6925 0    50   ~ 0
ADC_IN4
$Comp
L board:EZO_Inline_Voltage_Isolator U5
U 1 1 5E3E7CC7
P 1475 975
AR Path="/5E3E7CC7" Ref="U5"  Part="1" 
AR Path="/5E34E7FA/5E3E7CC7" Ref="U?"  Part="1" 
F 0 "U5" H 1475 1400 39  0000 C CNN
F 1 "EZO_Inline_Voltage_Isolator" H 1475 1325 39  0000 C CNN
F 2 "board:EZO_voltage_isolator" H 2525 1525 20  0001 C CNN
F 3 "https://www.atlas-scientific.com/product_pages/circuits/basic-ezo.html" H 2525 1525 20  0001 C CNN
	1    1475 975 
	1    0    0    -1  
$EndComp
$Comp
L Device:LED_ABRG D1
U 1 1 5FE28432
P 1525 10650
F 0 "D1" H 1525 11147 50  0000 C CNN
F 1 "LED_ABRG" H 1525 11056 50  0000 C CNN
F 2 "board:LED_150141M173100" H 1525 10650 50  0001 C CNN
F 3 "https://www.we-online.de/katalog/datasheet/150141M173100.pdf" H 1525 10650 50  0001 C CNN
	1    1525 10650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5FE2A264
P 1825 10650
F 0 "#PWR013" H 1825 10500 50  0001 C CNN
F 1 "+5V" H 1840 10823 50  0000 C CNN
F 2 "" H 1825 10650 50  0001 C CNN
F 3 "" H 1825 10650 50  0001 C CNN
	1    1825 10650
	0    1    1    0   
$EndComp
Wire Wire Line
	1825 10650 1725 10650
Wire Wire Line
	4550 3150 4700 3150
Wire Wire Line
	4550 2850 4700 2850
Wire Wire Line
	5200 6475 5200 6625
Wire Wire Line
	3825 1225 6450 1225
$Comp
L board:EZO_Embedded_Circuit U3
U 1 1 5E413214
P 1450 4100
AR Path="/5E413214" Ref="U3"  Part="1" 
AR Path="/5E34E7FA/5E413214" Ref="U?"  Part="1" 
F 0 "U3" H 1450 4375 39  0000 C CNN
F 1 "EZO_Embedded_Circuit_RTD" H 1450 4300 39  0000 C CNN
F 2 "board:EZO_circuit" H 1950 4500 39  0001 C CNN
F 3 "https://www.atlas-scientific.com/product_pages/circuits/ezo_rtd.html" H 1950 4500 39  0001 C CNN
	1    1450 4100
	1    0    0    -1  
$EndComp
Connection ~ 5200 6625
Wire Wire Line
	5200 6625 5200 6775
Connection ~ 4700 2850
Wire Wire Line
	4700 2850 5425 2850
Connection ~ 4700 3150
Wire Wire Line
	4700 3150 5425 3150
$EndSCHEMATC
