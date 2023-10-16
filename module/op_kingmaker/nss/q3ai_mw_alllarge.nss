//::///////////////////////////////////////////////
//:: q3ai_mw_alllarge
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to make sure the PC is not a gnome or a halfling
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetRacialType(oPC)!=RACIAL_TYPE_GNOME
        && GetRacialType(oPC)!=RACIAL_TYPE_HALFLING;
    return iResult;
}
