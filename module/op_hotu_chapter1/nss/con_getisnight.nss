//::///////////////////////////////////////////////
//:: con_getisnight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if it is nighttime.
    Most townies will use this script
    if they are 'in bed'.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetIsNight();
    return iResult;
}
