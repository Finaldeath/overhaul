//::///////////////////////////////////////////////
//:: Witchwork 1: Ragpicker Reflex Save Check
//:: WW1_Ragp_Reflex.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player makes a successful
     Reflex Save. If the player is repeating the
     conversation and has already lost a finger,
     automatically return FALSE.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 3, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bReflexSave = ReflexSave(oPC, 11);
    int bNoFinger = GetLocalInt(oPC, "CONV_RAGPICKER_Fingerless");

    if (bReflexSave == TRUE &&
        bNoFinger == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
