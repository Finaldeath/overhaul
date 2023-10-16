//::///////////////////////////////////////////////
//:: Player has cell key
//:: q2c24b_hasckey
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player has the cell key
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    object oKey = GetItemPossessedBy(oPC,"q2c24b_cellkey");
    iResult = GetIsObjectValid(oKey)
        && GetLocalInt(OBJECT_SELF,"Q2C24B_PRISON_UNLOCKED")==0;
    return iResult;
}
