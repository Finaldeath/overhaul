//::///////////////////////////////////////////////
//:: Name act_q2d2pit_4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Pay wager if bet was won and set up variables again
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 7/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    //Pay Wager -
    if (GetLocalInt(GetModule(), "X2_Q2DPitWager") == GetLocalInt(GetModule(), "X2_Q2DPitWinner"))
    {
        //if Blue was bet on - payout is 1000gp
        if (GetLocalInt(GetModule(), "X2_Q2DPitWager") == 2)
        {
            GiveGoldToCreature(oPC, 1000);
        }
       //if Red or own slave is bet on
       else
            GiveGoldToCreature(oPC, 1000);
    }
    //Reset Variables
    SetLocalInt(GetModule(), "X2_Q2DPitFightReady", 0);
    SetLocalInt(GetModule(), "X2_Q2DPitWager", 0);

}
