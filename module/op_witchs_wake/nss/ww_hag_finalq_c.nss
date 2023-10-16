//::///////////////////////////////////////////////
//:: Witchwork: Final Question to the Night Hag Condition
//:: WW_Hag_FinalQ_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player is flagged as
     having asked his final question of the Night
     Hag
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bFinalQ = GetLocalInt(oPC, "bFinalQ");

    if (bFinalQ == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
