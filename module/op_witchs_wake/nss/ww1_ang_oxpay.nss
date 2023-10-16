//::///////////////////////////////////////////////
//:: Witch's Wake 1: Angmar Ox Payment
//:: WW1_Ang_OxPay.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player gives Angmar 50 gp in repayment
     for attacking his ox.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "AngmarOxPayment", TRUE);
    TakeGoldFromCreature(50, oPC);
}
