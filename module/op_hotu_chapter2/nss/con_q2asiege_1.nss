//::///////////////////////////////////////////////
//:: Name con_q2asiege_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Test to see if the Matron still has Illithids
    in her army
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 18/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DOvermind") < 2)
        return TRUE;
    return FALSE;
}
