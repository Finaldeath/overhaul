//::///////////////////////////////////////////////
//:: Name con_q2asiege_8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Matron has some Shadow Attackers
    in her army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "x2_plot_shadow_in") == 1)
        return TRUE;
    return FALSE;
}
