//::///////////////////////////////////////////////
//:: Fourth Door
//:: con_q3c_copper
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player is at the fourth door
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_Q3C_DOOR")==3;
    return iResult;
}
