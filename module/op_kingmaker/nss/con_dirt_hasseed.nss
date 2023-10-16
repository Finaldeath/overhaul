//::///////////////////////////////////////////////
//:: PC has seed
//:: con_dirt_hasseed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC has Kaidala's
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    object oSeed = GetItemPossessedBy(oPC,"q1_kaidala_seed");
    iResult = GetIsObjectValid(oSeed);
    return iResult;
}
