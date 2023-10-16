//:://////////////////////////////////////////////////
//:: act_trp_quit
//:: Copyright (c) 2002 Bioware
//:://////////////////////////////////////////////////
/*
The henchman's been pissed off so badly s/he's going
to quit working for this player and go back to his/her
waypoint.

 */
//:://////////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////////

#include "x0_i0_henchman"

void main()
{
    QuitHenchman(GetPCSpeaker());
    object oHome = GetObjectByTag("q2_way_trphome");
    if (GetIsObjectValid(oHome) == TRUE)
    {
//            ClearAllActions();
        JumpToObject(oHome);
    }
}
