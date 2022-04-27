/*
 * Pedal_Map.h
 *
 *  Created on: Jul 9, 2021
 *      Author: jan
 */

#ifndef INC_PEDAL_MAP_H_
#define INC_PEDAL_MAP_H_

extern const int APPS_REAL_MAX;
extern const int APPS_REAL_MIN;

float horner(const float *arry, unsigned int array_size, float x)
{
    float s = 0;
    for(unsigned int i = 0; i < array_size ; i++){
        s = s*(x) + arry[i];
    }
    return s;
}


enum struct APPS_map_profile{
    APPS_MAP_1_linear,
    APPS_MAP_2,
    APPS_MAP_3,
    APPS_MAP_4
} ;


int apps_nonlinear_curve(int apps, APPS_map_profile map){

    float apps_f = static_cast<float>(apps);

    const float pedal_map[4][5]  = {
        // linear #dziala
        { 0.00,  0.00,   0.00,   1.00,  0.00},
        // blue #dziala
        {-0.000000002291667,   0.000002986111111,  -0.000572916666667,   0.827579365079361,  -0.797619047618863},
        // green #dziala
        { 0.000000014583333,  -0.000009768518519,   0.002368055555556,   0.434391534391535,   0.198412698412663},
        // red  #dziala
        { 0.000000011458333,  -0.000006319444444,   0.001156250000000,   0.568253968253969,   0.297619047618997} };

    const uint16_t array_order = sizeof(pedal_map[0]) / sizeof(pedal_map[0][0]);
    static_assert(array_order == 5, "Array is using 4 order polynomial");

    std::size_t map_it = static_cast<std::size_t>(map);

    int torque = (int)(horner(&pedal_map[map_it][0],array_order,apps_f) + 0.5);

    torque = std::clamp(torque, APPS_REAL_MIN, APPS_REAL_MAX);

    return torque;
}

#endif /* INC_PEDAL_MAP_H_ */
