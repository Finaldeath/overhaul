//::///////////////////////////////////////////////
//:: Name x1_death_chaos
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

void main()
{
    object oPC = GetLastKiller();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nChaosHit") != 1)
    {
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 1);
        SetLocalInt(OBJECT_SELF, "nChaosHit", 1);
    }
}
