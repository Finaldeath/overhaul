//::///////////////////////////////////////////////
//:: Mephistopheles, Player Chose Replace (Condition Script)
//:: H9c_Meph_Replace.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player chose to Replace
     Mephistopheles.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sChoice = GetLocalString(GetModule(), "sPCEndChoice");
    if (sChoice == "Replace")
    {
        return TRUE;
    }
    return FALSE;
}
