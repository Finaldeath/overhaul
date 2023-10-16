//::///////////////////////////////////////////////
//:: Priests Guild undecided
//:: con_lav_guildvot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Priests' guild has not yet voted for the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    int nVote = GetLocalInt(oPC,"os_templeguild_pc");
    iResult = (nVote != 60
        && nVote != 100)
        && GetLocalInt(oPC,"os_jointemple_pc")<10;
    return iResult;
}
