//::///////////////////////////////////////////////
//:: Name act_q1bpiper_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Take 10gp from the PC
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 14/03
//:://////////////////////////////////////////////

void main()
{
    TakeGoldFromCreature(10, GetPCSpeaker());

    int nAlign = GetAlignmentGoodEvil(GetPCSpeaker());
    if (nAlign == ALIGNMENT_EVIL)
    {
        AdjustAlignment(GetPCSpeaker(), ALIGNMENT_GOOD, 3);
    }

}
