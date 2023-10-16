//::///////////////////////////////////////////////
//:: con_q2dnath_2x
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    check to see if Nathyrra has been talked to once
    GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel")
    And check that Formians haven't been freed yet

*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 2, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel") == 1
        && GetLocalInt(GetModule(), "Formian_Talk")==0)
        return TRUE;
    return FALSE;
}


