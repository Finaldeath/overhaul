//::///////////////////////////////////////////////
//:: os_con_hashealp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has a healing potion
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    object oPot1 = GetItemPossessedBy(oPC,"NW_IT_MPOTION003");//critical
    object oPot2 = GetItemPossessedBy(oPC,"NW_IT_MPOTION001");//light
    object oPot3 = GetItemPossessedBy(oPC,"NW_IT_MPOTION020");//moderate
    object oPot4 = GetItemPossessedBy(oPC,"NW_IT_MPOTION002");//serious
    object oPot5 = GetItemPossessedBy(oPC,"NW_IT_MPOTION012");//heal
    iResult = GetIsObjectValid(oPot1)
        || GetIsObjectValid(oPot2)
        || GetIsObjectValid(oPot3)
        || GetIsObjectValid(oPot4)
        || GetIsObjectValid(oPot5);
    return iResult;
}
