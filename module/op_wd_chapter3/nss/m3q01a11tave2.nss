//* take five gold from player
#include "nw_i0_plot"
#include "m3plotinclude"

void main()

{
    gplotAppraiseOpenStore(GetObjectByTag("NW_STOREBAR01"), GetPCSpeaker());
}
