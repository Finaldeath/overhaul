//::///////////////////////////////////////////////
//:: End Narration, Knowers Freed from Persecution (Condition Script)
//:: H10c_End_Knower1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player forced
     Mephistopheles to surrender Cania to the
     Knowers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "CaniaKnowers")
    {
        return TRUE;
    }
    return FALSE;
}
