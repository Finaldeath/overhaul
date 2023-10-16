//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag, Player Received Key
//:: WW1_Hag_Key_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has been given the
     key to the cemetery gates and sent off to
     seek the Cavanaugh Stone in Brogan's Arm.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bKey = GetLocalInt(oPC, "CONV_NIGHT_HAG_Key");

    if (bKey == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
