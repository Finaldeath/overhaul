//::///////////////////////////////////////////////
//:: Name q1hall_bashchst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give small chaotic hit to whoever destroys
    this locked door...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 13/03
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"
void main()
{
    object oPC = GetLastKiller();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nChaosHit") != 1)
    {
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 1);
        SetLocalInt(OBJECT_SELF, "nChaosHit", 1);
        GenerateLowTreasure(oPC, OBJECT_SELF);
    }
}



