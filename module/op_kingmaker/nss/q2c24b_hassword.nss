//::///////////////////////////////////////////////
//:: Player has sword
//:: q2c24b_hassword
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player has a short sword the prisoner can use
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    object oSword = GetItemPossessedBy(oPC,"NW_WSWSS001");
    iResult = GetIsObjectValid(oSword);
    return iResult;
}
