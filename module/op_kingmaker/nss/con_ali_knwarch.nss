//::///////////////////////////////////////////////
//:: Know Archaeologist
//:: con_ali_knwarch
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows about the archaeologist quest
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oGord = GetObjectByTag("q2_thegord");
    iResult = GetLocalInt(GetModule(), "OS_THEGORD_ARCH")>=20;
    return iResult;
}
