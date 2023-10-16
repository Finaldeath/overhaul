//::///////////////////////////////////////////////
//:: con_gem_undead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has finished the archaeologist quest and has not yet
    talked to the gem about the undead
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oGord = GetObjectByTag("q2_thegord");
    object oPC = GetFirstPC();
    iResult = GetLocalInt(GetModule(), "OS_THEGORD_ARCH")>=30
        && GetLocalInt(oPC,"OS_GEM_UNDEAD")==0;
    return iResult;
}
