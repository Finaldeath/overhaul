//::///////////////////////////////////////////////
//:: Name con_q2asiege_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Matron still has Beholders
    in her army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "x2_plot_beholders_out") == 0)
        return TRUE;
    return FALSE;
}
