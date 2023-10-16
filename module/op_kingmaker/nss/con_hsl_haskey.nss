//::///////////////////////////////////////////////
//:: Has Cage Key
//:: con_hsl_haskey
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC has the key to the slave cage
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    object oPC = GetFirstPC();
    object oItem = GetItemPossessedBy(oPC,"q3_itm_slavekey");
    iResult = GetIsObjectValid(oItem);
    return iResult;
}
