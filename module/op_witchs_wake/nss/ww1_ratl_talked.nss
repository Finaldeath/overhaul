//::///////////////////////////////////////////////
//:: Witchwork 1: Ratling, Talked To
//:: WW1_Ratl_Talked.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the the player has already
     seen the Ratling's conversation through to
     the end.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 26, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bEnd = GetLocalInt(oPC, "CONV_RATLING_End");

    if (bEnd == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
