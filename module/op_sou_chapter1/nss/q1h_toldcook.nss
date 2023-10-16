// the herbalist has told the PC that the cook has the berries

#include "NW_I0_PLOT"

void main()
{
    SetPLocalInt(GetPCSpeaker(), "Herbalist_Told_Cook", 1);
}
