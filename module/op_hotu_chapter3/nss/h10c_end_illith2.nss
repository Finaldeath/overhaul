//::///////////////////////////////////////////////
//:: End Narration, Overmind Killed (Condition Script)
//:: H10c_End_Illith2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player killed the
     Illithid Overmind in Ch2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bFate = GetLocalInt(GetModule(), "X2_Q2DOvermind");
    if (bFate == 1)
    {
        return TRUE;
    }
    return FALSE;
}
