//::///////////////////////////////////////////////
//:: Witchwork 1: Armsman, Talked To
//:: WW1_Arm_Talked.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the the player has already
     exited out of the Armsman's conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 26, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bEnd = GetLocalInt(oPC, "CONV_ARMSMAN_End");

    if (bEnd == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
