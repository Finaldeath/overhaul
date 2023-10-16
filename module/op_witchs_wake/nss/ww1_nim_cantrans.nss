//::///////////////////////////////////////////////
//:: Witchwork 1: Nimmermaer, Can Translate
//:: WW1_Nim_CanTrans.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has learned that
     Nimmermaer can translate the tears message.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 22, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bPCKnows = GetLocalInt(oPC, "XP_KN_NimmerCanTrans");

    if (bPCKnows == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
