//::///////////////////////////////////////////////
//:: Name con_q2asiege_12
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Rebels have some azer
    in their army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "x2_plot_rebelazer_in") == 0)
        return TRUE;
    return FALSE;
}
