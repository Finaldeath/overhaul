//::///////////////////////////////////////////////
//:: Check to see if the puzzle can be turned down in intensity
//:: con_km_cnslright
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if the puzzle can be turned down in intensity
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult = FALSE;
    object oSelf = GetObjectByTag("km_finalcontroller");

    if (GetLocalInt(oSelf, "PUZ_STATE") > 0)
    {
        iResult = TRUE;
    }

    return iResult;
}
