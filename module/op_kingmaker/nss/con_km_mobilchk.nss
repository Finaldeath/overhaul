//::///////////////////////////////////////////////
//:: Check for a mobile mirror
//:: con_km_mobilchk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    See if the mirror is flagged to be movable to another
    Bracket.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult = 0;

    if (GetLocalInt(OBJECT_SELF, "MIR_MOBILE")==1)
    {
        iResult = TRUE;
    }

    return iResult;
}
