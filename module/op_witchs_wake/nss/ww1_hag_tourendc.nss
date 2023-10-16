//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Tour End (Condition)
//:: WW1_Hag_TourEndC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has completed the
     Night Hag's tour of the Plane of Sorrows.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 15, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bTourComplete = GetLocalInt(oPC, "CONV_NIGHT_HAG_TourComplete");

    if (bTourComplete == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
