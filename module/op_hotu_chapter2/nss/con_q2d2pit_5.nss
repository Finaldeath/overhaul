//::///////////////////////////////////////////////
//:: Name con_q2d2pit_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the fight has taken place and the PC not wagered
    on anyone..

    Player's Wager
    X2_Q2DPitWager = 0   - Neither
    X2_Q2DPitWager = 1   - Red
    X2_Q2DPitWager = 2   - Blue

    Fight Winner
    X2_Q2DPitWinner = 1   - Red
    X2_Q2DPitWinner = 2   - Blue

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 7/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DPitFightReady") == 2)
    {
        if (GetLocalInt(GetModule(), "X2_Q2DPitWager") == 0)
        {
            return TRUE;
        }
    }
    return FALSE;
}
