//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker 2nd Time Talked To
//:: WW1_Ragp_2ndTime.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player is talking to the
    actual Ragpicker creature rather than the
    invisible placeable (ie: PC has completed the
    initial conversation).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sMyTag = GetTag(OBJECT_SELF);

    if (sMyTag == "Ragpicker")
    {
        return TRUE;
    }
    return FALSE;
}
