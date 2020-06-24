#include <gb/gb.h>
#include "helper/box.c"
UINT8 tilebuffer[16*9];

/* TESTS:
 *  set_bkg_data()
 *  set_bkg_tiles()
 *  scroll_bkg()
 *  wait_vbl_done()
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
    SHOW_BKG;
    DISPLAY_ON;
    // generate box tiles
    box_generate(0);
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
    wait_vbl_done();
    wait_vbl_done();
    __asm__(" ld b,b");
}