//::///////////////////////////////////////////////
//:: Caves Done
//:: con_ali_cavedone
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has finished Serah's caves and collected the reward
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"os_serahcaves")==99;
    return iResult;
}
