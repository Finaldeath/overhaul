//::///////////////////////////////////////////////
//:: Fifth Door
//:: con_q3c_barbed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player is at the fifth door
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_Q3C_DOOR")==4;
    return iResult;
}
