//::///////////////////////////////////////////////
//:: End Narration, Mephistopheles Banished (Condition Script)
//:: H10c_End_Meph3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player banished
     Mephistopheles in some fashion.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "Banish" ||
        sFate == "CaniaKnowers")
    {
        return TRUE;
    }
    return FALSE;
}
