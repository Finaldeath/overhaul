//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if the bridge is variable
    The variable is set to 10 in the bk_sunblast script
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_BRIDGEAPPEARED") == 10)
    {
        return TRUE;
    }

    return FALSE;

}
