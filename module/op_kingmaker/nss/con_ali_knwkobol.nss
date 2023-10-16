//::///////////////////////////////////////////////
//:: Know Kobold
//:: con_ali_knwkobol
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows about the kobold quest
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oGord = GetObjectByTag("q2_thegord");
    iResult = GetLocalInt(GetModule(), "OS_THEGORD_COWS")>=20;
    return iResult;
}
