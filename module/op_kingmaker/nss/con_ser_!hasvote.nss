//::///////////////////////////////////////////////
//:: No Vote
//:: con_ser_!hasvote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC does not have the landowner's guild vote yet
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_LANDGUILD_PC")!=10;
    return iResult;
}
