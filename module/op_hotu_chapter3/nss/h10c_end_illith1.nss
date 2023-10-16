//::///////////////////////////////////////////////
//:: End Narration, Illithids Side With Drow (Condition Script)
//:: H10c_End_Illith1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Illithids sided with the
     drow in Ch2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bFate = GetLocalInt(GetModule(), "X2_Q2DOvermind");
    if (bFate == 0)
    {
        return TRUE;
    }
    return FALSE;

}
