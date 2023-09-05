/*
 * CAN_meta.h
 *
 *  Created on: Nov 23, 2020
 *      Author: kwitnoncy
 */

#ifndef INC_APPS_META_HPP_
#define INC_APPS_META_HPP_

#include <main.h>
#include <math.h>
static_assert(sizeof(int) == 4);

const int APPS_CAN_ID = 0x0A;
const int APPS_CAN_DLC = 2;

// global scope
CAN_TxHeaderTypeDef tx_header_apps_data {
               APPS_CAN_ID,
               0xFFF,
               CAN_ID_STD,
               CAN_RTR_DATA,
               APPS_CAN_DLC,
               DISABLE
};

uint32_t mail_data_apps = 0;

/* The commanded motor torque must remain at 0 N m until the APPS signals less than 5 %
 pedal travel and 0 N m desired motor torque, regardless of whether the brakes are still actuated or not.  */
const float apps_dead_zone = 0.05;

// const for apps sensor 1
const int APPS_1_RAW_MIN = 783;
const int APPS_1_RAW_MAX = 4010;
static_assert(APPS_1_RAW_MIN < APPS_1_RAW_MAX);

const int APPS_1_RAW_FULLSCALE = APPS_1_RAW_MAX - APPS_1_RAW_MIN;
const int APPS_1_OFFSETTED_MIN = (int)std::round(APPS_1_RAW_FULLSCALE * apps_dead_zone + APPS_1_RAW_MIN);

// const for apps sensor 2
const int APPS_2_RAW_MIN = 1083;
const int APPS_2_RAW_MAX = 4000;
static_assert(APPS_2_RAW_MIN < APPS_2_RAW_MAX);

const int APPS_2_RAW_FULLSCALE = APPS_2_RAW_MAX - APPS_2_RAW_MIN;
const int APPS_2_OFFSETTED_MIN = (int)std::round(APPS_2_RAW_FULLSCALE * apps_dead_zone + APPS_2_RAW_MIN);

// const for apps scaled values
const int APPS_REAL_MIN = 0;
const int APPS_REAL_MAX = 500;
static_assert(APPS_REAL_MIN < APPS_REAL_MAX);
const int APPS_REAL_SCALE = APPS_REAL_MAX - APPS_REAL_MIN;

const float scale_factor_1 = (float)(((float)APPS_1_RAW_MAX - (float)APPS_1_OFFSETTED_MIN) / (float)APPS_REAL_MAX);
const float scale_factor_2 = (float)(((float)APPS_2_RAW_MAX - (float)APPS_2_OFFSETTED_MIN) / (float)APPS_REAL_MAX);

// FIXME sensor value to 10%
const float sensor_implausibility_factor = 0.18;

/*
 https://www.formulastudent.de/fileadmin/user_upload/all/2020/rules/FS-Rules_2020_V1.0.pdf
 */

#endif /* INC_APPS_META_HPP_ */
