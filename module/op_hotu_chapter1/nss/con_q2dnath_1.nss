//::///////////////////////////////////////////////
//:: con_q2dnath_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if the NPC has been talked to 0 times
   GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel")
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 2, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel") == 0)
        return TRUE;
    return FALSE;
}
