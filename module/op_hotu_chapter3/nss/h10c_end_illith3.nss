//::///////////////////////////////////////////////
//:: End Narration, Illithids Gain Shattered Mirror (Condition Script)
//:: H10c_End_Illith3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player gave the Shattered
     Mirror to the Illithids in Ch2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bFate = GetLocalInt(GetModule(), "X2_Q2DOvermind");
    if (bFate == 2)
    {
        return TRUE;
    }
    return FALSE;
}
