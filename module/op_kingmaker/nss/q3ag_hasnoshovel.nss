//::///////////////////////////////////////////////
//:: Has no shovel?
//:: q3ag_hasnoshovel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player has no shovel.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 7, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    object oShovel = GetItemPossessedBy(oPC,"q3ag_itm_shovel");
    iResult = !GetIsObjectValid(oShovel);
    return iResult;
}
