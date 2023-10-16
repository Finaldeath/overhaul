//::///////////////////////////////////////////////
//:: End Narration, Good Player Replaces Meph (Condition Script)
//:: H10c_End_Player5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player is good and
     chose to replace Mephistopheles.
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
    if (iAlignment == ALIGNMENT_GOOD &&
        sChoice == "Replace")
    {
        return TRUE;
    }
    return FALSE;
}
