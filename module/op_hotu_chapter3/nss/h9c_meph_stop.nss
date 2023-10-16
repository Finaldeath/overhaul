//::///////////////////////////////////////////////
//:: Mephistopheles, Player Chose Stop (Condition Script)
//:: H9c_Meph_Stop.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player chose to Stop
     Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sChoice = GetLocalString(GetModule(), "sPCEndChoice");
    if (sChoice == "Stop")
    {
        return TRUE;
    }
    return FALSE;
}
