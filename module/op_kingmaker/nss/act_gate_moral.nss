//::///////////////////////////////////////////////
//:: act_gate_moral
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Takes the player's alignment and destroys a minion
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oMinion = GetNearestObjectByTag("q3_idrowarcher");
    int nAlign = GetAlignmentGoodEvil(oPC);
    if(nAlign == ALIGNMENT_EVIL)
    {
        AdjustAlignment(oPC,ALIGNMENT_GOOD, 50);
    }
    else if(nAlign == ALIGNMENT_GOOD)
    {
        AdjustAlignment(oPC,ALIGNMENT_EVIL,50);
    }
    else if(nAlign == ALIGNMENT_NEUTRAL)
    {
        AdjustAlignment(oPC,ALIGNMENT_EVIL,50);
    }
    DestroyObject(oMinion);
    if(os_GetXPReceived())
    {
        os_SetXPReceived();
        GiveXPToCreature(oPC,250);
    }
}
