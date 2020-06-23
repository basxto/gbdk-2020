#include <gb/gb.h>
const UINT8 white = 0x00;
const UINT8 black = 0xFF;
const UINT8 left = 0x80;
const UINT8 right = 0x01;
UINT8 tile[16];
UINT8 tilebuffer[16*9];

void normal_top_bottom(UINT8 index){
    // write it regular
    set_bkg_data(index, 1, tile);
    // write with top line
    tile[1] = tile[0] = black;
    set_bkg_data(index+1, 1, tile);
    // write with bottom line
    tile[1] = tile[0] = tile[2];
    tile[14] = tile[15] = black;
    set_bkg_data(index+2, 1, tile);
}

/* TESTS:
 *  set_bkg_data()
 *  set_bkg_tiles()
 *  get_bkg_data()
 *  scroll_bkg()
**/
void main() {
    // draws a box with generated tiles
    UINT8 boxmap[] = {
        4, 1, 1, 1, 7,
        3, 0, 0, 0, 6,
        3, 0, 0, 0, 6,
        3, 0, 0, 0, 6,
        5, 2, 2, 2, 8
    };
    DISPLAY_OFF;
    HIDE_BKG;
    HIDE_WIN;
    HIDE_SPRITES;
    cgb_compatibility();
    // generate box tiles
    for(UINT8 i = 0; i < 16; ++i)
        tile[i] = white;
    normal_top_bottom(0);
    for(UINT8 i = 0; i < 16; ++i)
        tile[i] = left;
    normal_top_bottom(3);
    for(UINT8 i = 0; i < 16; ++i)
        tile[i] = right;
    normal_top_bottom(6);
    // read them back
    get_bkg_data(0, 9, tilebuffer);
    // generate inverted tiles
    for(UINT8 i = 0; i < 16*9; ++i)
        tilebuffer[i] = ~tilebuffer[i];
    set_bkg_data(9, 9, tilebuffer);

    // draw box
    set_bkg_tiles(8, 5, 5, 5, boxmap);
    set_bkg_tiles(4, 8, 5, 5, boxmap);
    // shift to black box
    for(UINT8 i = 0; i < 5*5; ++i)
        boxmap[i] += 9;
    set_bkg_tiles(12, 8, 5, 5, boxmap);
    // move background a bit
    scroll_bkg(5, 9);
    SHOW_BKG;
    DISPLAY_ON;
    wait_vbl_done();
    wait_vbl_done();
    __asm__(" ld b,b");
}