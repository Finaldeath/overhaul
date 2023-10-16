//::///////////////////////////////////////////////
//:: End Narration, Evil Player Stops Meph (Condition Script)
//:: H10c_End_Player2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player is evil and
     chose to stop Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iAlignment = GetAlignmentGoodEvil(oPC);
    string sChoice = GetLocalString(GetModule(), "sPCEndChoice");
    if (iAlignment == ALIGNMENT_EVIL &&
        sChoice == "Stop")
    {
        return TRUE;
    }
    return FALSE;
}
