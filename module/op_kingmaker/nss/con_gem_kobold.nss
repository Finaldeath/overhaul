//::///////////////////////////////////////////////
//:: con_gem_kobold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has finished the cow quest and has not yet
    talked to the gem about the cows
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
    iResult = GetLocalInt(GetModule(), "OS_THEGORD_COWS")>=30
        && GetLocalInt(oPC,"OS_GEM_COWS")==0;
    return iResult;
}
