// flag player as entered tunnels

#include "nw_i0_plot"

void main()
{
    object oPC = GetEnteringObject();
    if(GetIsPlayerCharacter(oPC))
        SetLocalInt(GetModule(), "ENTERED_TUNNELS", 1); // used in the henchman trigger above
}
