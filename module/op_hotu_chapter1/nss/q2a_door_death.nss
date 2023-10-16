//::///////////////////////////////////////////////
//:: Name: q2a_door_death
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When this door is destroyed - adjust the openners
    Alignment towards Chaos (away from Law).
    Break and Enter...tsk..tsk...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Jan 23/03
//:://////////////////////////////////////////////
#include "x2_inc_compon"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
    object oPC = GetLastKiller();
    AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 1);
    craft_drop_placeable();
}
