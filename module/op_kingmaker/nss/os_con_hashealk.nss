//::///////////////////////////////////////////////
//:: os_con_hashealk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has a healing kit
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    object oKit1 = GetItemPossessedBy(oPC,"NW_IT_MEDKIT001");//+1
    object oKit2 = GetItemPossessedBy(oPC,"NW_IT_MEDKIT004");//+10
    object oKit3 = GetItemPossessedBy(oPC,"NW_IT_MEDKIT002");//+3
    object oKit4 = GetItemPossessedBy(oPC,"NW_IT_MEDKIT003");//+6
    iResult = GetIsObjectValid(oKit1)
        || GetIsObjectValid(oKit2)
        || GetIsObjectValid(oKit3)
        || GetIsObjectValid(oKit4);
    return iResult;
}
