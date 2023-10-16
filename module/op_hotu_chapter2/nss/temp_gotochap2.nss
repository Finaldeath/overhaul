#include "x2_inc_globals"

void main()
{
    object oEnter = GetEnteringObject();
    if(!GetIsPC(oEnter))
        return;
    ReturnToChapter2();
}
