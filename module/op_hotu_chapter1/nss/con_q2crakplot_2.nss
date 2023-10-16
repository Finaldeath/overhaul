//::///////////////////////////////////////////////
//:: Name: con_q2crakplot_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check a variable used in Henchmen conversations
    for what the PC knows about the false Linu
    and the Rakshasa

    X2_PCKnowsRakshasa
    0   PC knows nothing
    1   PC has met Linu in the Rakshasa area - doesn't know she's a fake
    2   PC knows that Linu was a fake
    3   PC has found the real Linu
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 16/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_PCKnowsRakshasa") == 2)
        return TRUE;
    return FALSE;
}
