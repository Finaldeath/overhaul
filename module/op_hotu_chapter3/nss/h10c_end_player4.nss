//::///////////////////////////////////////////////
//:: End Narration, Player Joins Meph (Condition Script)
//:: H10c_End_Player4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player chose to join
     Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //string sChoice = GetLocalString(GetModule(), "sPCEndChoice");
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "Co-Ruler")
    {
        return TRUE;
    }
    return FALSE;
}
