//::///////////////////////////////////////////////
//:: Mephistopheles, Player Chose Join (Condition Script)
//:: H9c_Meph_Join.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player chose to Join
     Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sChoice = GetLocalString(GetModule(), "sPCEndChoice");
    if (sChoice == "Join")
    {
        return TRUE;
    }
    return FALSE;
}
