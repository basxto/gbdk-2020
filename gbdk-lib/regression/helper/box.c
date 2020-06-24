#include <gb/gb.h>
const UINT8 white = 0x00;
const UINT8 black = 0xFF;
const UINT8 left = 0x80;
const UINT8 right = 0x01;
UINT8 tile[16];

/* TESTS:
 *  set_bkg_data()
**/

void box_normal_top_bottom(UINT8 index){
    // write it regular
    set_bkg_data(index, 1, tile);
    // write with top line
    tile[1] = tile[0] = black;
    set_bkg_data(index + 1, 1, tile);
    // write with bottom line
    tile[1] = tile[0] = tile[2];
    tile[14] = tile[15] = black;
    set_bkg_data(index + 2, 1, tile);
}

void box_generate(UINT8 index){
    // generate box tiles
    for(UINT8 i = 0; i < 16; ++i)
        tile[i] = white;
    box_normal_top_bottom(index);
    for(UINT8 i = 0; i < 16; ++i)
        tile[i] = left;
    box_normal_top_bottom(index + 3);
    for(UINT8 i = 0; i < 16; ++i)
        tile[i] = right;
    box_normal_top_bottom(index + 6);
}