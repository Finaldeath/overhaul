//::///////////////////////////////////////////////
//:: Archeologist finished
//:: con_ohi_jobover
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has brought the archeologist to the end of the caverns
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oGord = GetObjectByTag("q2_thegord");
    iResult = GetLocalInt(GetModule(), "OS_THEGORD_ARCH")>=30;
    return iResult;
}
