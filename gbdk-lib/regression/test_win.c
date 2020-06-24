#include <gb/gb.h>
#include "helper/box.c"

/* TESTS:
 *  set_bkg_data()
 *  set_bkg_tiles()
 *  get_win_tiles()
 *  scroll_bkg()
 *  move_win()
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
    SHOW_WIN;
    DISPLAY_ON;
    // generate box tiles
    scroll_bkg(2, 85);
    move_win(6, 98);
    box_generate(0);
    set_bkg_tiles(8, 20, 5, 2, boxmap);
    set_win_tiles(8, 0, 5, 2, boxmap+20);

    wait_vbl_done();
    wait_vbl_done();
    __asm__(" ld b,b");
}