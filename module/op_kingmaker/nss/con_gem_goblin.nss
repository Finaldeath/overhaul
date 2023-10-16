//::///////////////////////////////////////////////
//:: con_gem_goblin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has finished the goblin quest and has not yet
    talked to the gem about the goblins
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"os_serahcaves")>=30
        && GetLocalInt(oPC,"OS_GEM_GOBLIN")==0;
    return iResult;
}
