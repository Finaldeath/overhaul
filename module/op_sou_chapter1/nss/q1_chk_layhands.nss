//::///////////////////////////////////////////////
//:: Name q1_chk_layhands
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has any lay hands left for the day
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetHasFeat(FEAT_LAY_ON_HANDS, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}
