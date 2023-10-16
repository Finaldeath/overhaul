//::///////////////////////////////////////////////
//:: End Narration, Mephistopheles Became Kind (Condition Script)
//:: H10c_End_Meph2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player caused
     Mephistopheles to become kindhearted.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "Kindhearted")
    {
        return TRUE;
    }
    return FALSE;
}
