//::///////////////////////////////////////////////
//:: Witchwork 1: Ethereal Leak, No Instructions From Night Hag
//:: WW1_Leak_NoHag.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the Night Hag has not yet
    instructed the player as to how the leak
    can be used.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 21, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bLeakInstructions = GetLocalInt(oPC, "CONV_NIGHT_HAG_Leak");

    if (bLeakInstructions == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
