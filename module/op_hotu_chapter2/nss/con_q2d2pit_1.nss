//::///////////////////////////////////////////////
//:: Name con_q2d2pit_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the fight has been set up, but has not
    taken place yet (the PC has not stuck his
    head in the window to start the cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 7/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DPitFightReady") == 1)
        return TRUE;
    return FALSE;
}
