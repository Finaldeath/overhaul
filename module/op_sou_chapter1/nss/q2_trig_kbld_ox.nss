// mark the player as not in the room (needed for a heartbeat check if a player has a weapon equipped)
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;

    SetLocalInt(oPC, "Q2_IN_KOBOLD_ROOM", 0);
}
