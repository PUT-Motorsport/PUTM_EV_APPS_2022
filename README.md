# Accelerator Pedal Position Sensor (APPS)

## Motivation

APPS handling is required by official FSG Rules according to T11.8 ([see](https://www.formulastudent.de/fileadmin/user_upload/all/2022/rules/FS-Rules_2022_v1.0.pdf#page=58)). APPS signals are system critical signals meaning that any implausibility between sensors or a failure should result in complete motor power shutdown.

## Pedal travel

* 0% - fully released
* 100% - fully applied

## Implausiblity

Implausibility is defined as a deviation of more than ten percentage points pedal travel
between any of the used APPSs. If it occurs for more than 100 ms the power to the motor must be immediately shut down.

## Platform

Software for APPS signal handling is developed using C++ for STM32 microcontroller.

## Program schematic

![APPS diagram](/DOCUMENTATION/APPS_diagram.png)
