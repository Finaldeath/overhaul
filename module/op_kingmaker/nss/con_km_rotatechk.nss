//::///////////////////////////////////////////////
//:: Check for a rotateable mirror
//:: con_km_rotatechk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    See if the mirror is flagged to be rotatable
    so it can change direction.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult = 0;
    object oMirror = GetObjectByTag("large_mirror_a");
    int iFacing = GetLocalInt(oMirror, "MIRROR_FACING");

    if (GetLocalInt(oMirror, "MIR_MOBILE")==2)
    {
        iResult = TRUE;
        SetCustomToken(9999, IntToString(iFacing));

    }

    return iResult;
}
