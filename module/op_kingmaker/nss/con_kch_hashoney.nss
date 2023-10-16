//::///////////////////////////////////////////////
//:: Kobolds have honey
//:: con_kch_hashoney
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has given honey to the kobolds
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_KOBOLD_HONEY")==10;
    return iResult;
}
