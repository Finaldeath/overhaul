//::///////////////////////////////////////////////
//:: con_q2dnath_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    check to see if Nathyrra has been talked to once
    GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel")

*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 2, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel") == 1)
        return TRUE;
    return FALSE;
}

