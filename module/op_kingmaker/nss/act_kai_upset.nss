//:://////////////////////////////////////////////////
//:: act_kai_upset
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
    SetLocalInt(OBJECT_SELF,"OS_KAI_UPSET",10);
    object oHome = GetObjectByTag("q1_way_kaitree");
    if (GetIsObjectValid(oHome) == TRUE)
    {
//            ClearAllActions();
        JumpToObject(oHome);
    }
}
