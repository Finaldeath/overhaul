//::///////////////////////////////////////////////
//:: con_gem_duergar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has finished the dwarf quest and has not yet
    talked to the gem about the duergar
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
    iResult = GetLocalInt(GetModule(), "OS_THEGORD_DWARF")>=30
        && GetLocalInt(oPC,"OS_GEM_DUERGAR")==0;
    return iResult;
}
