//::///////////////////////////////////////////////
//:: con_mom_army
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has spoken to the gem about the undead army
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_GEM_UNDEAD")==10;
    return iResult;
}
