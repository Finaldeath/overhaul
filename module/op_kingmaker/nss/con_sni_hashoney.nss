//::///////////////////////////////////////////////
//:: PC has Honey
//:: con_sni_hashoney
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC has honey
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    object oItem = GetItemPossessedBy(oPC,"q1_honey");
    iResult = GetIsObjectValid(oItem);
    return iResult;
}
