//::///////////////////////////////////////////////
//:: Name act_q2d2pit_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     PC has wagered on the Blue Gladiator contestant

     X2_Q2DPitWager = 1   - Red
     X2_Q2DPitWager = 2   - Blue

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 7/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(GetModule(), "X2_Q2DPitWager", 2);
    TakeGoldFromCreature(500, oPC);
}
