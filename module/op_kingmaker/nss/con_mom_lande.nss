//::///////////////////////////////////////////////
//:: Landowners' Vote
//:: con_mom_lande
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The landowners' guild is voting for Enivid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_LANDGUILD_PC")!=10;
    return iResult;
}
