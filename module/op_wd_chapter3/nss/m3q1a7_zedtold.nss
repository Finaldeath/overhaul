//::///////////////////////////////////////////////
//:: M3Q1A7_ZEDTOLD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Zed hasn't told the player about Griff before.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 17, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(),"NW_G_M1Q00PLOTSPIKED") != 99)
    {
        return TRUE;
    }
    return FALSE;
}

