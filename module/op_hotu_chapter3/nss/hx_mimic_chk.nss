//::///////////////////////////////////////////////
//:: hx_mimic_chk
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the mimic is alive.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brad Prince
//:: Created On:  Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetIsObjectValid(GetObjectByTag("hx_mimic")))
    {
        return TRUE;
    }
    return FALSE;
}
