//::///////////////////////////////////////////////
//:: End Narration, Mephistopheles Co-Rules (Condition Script)
//:: H10c_End_Meph5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player joined
     Mephistopheles in ruling the Prime Material.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "Co-Ruler")
    {
        return TRUE;
    }
    return FALSE;
}
