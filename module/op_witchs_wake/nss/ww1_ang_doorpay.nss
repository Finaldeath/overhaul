//::///////////////////////////////////////////////
//:: Witch's Wake 1: Angmar Door Payment
//:: WW1_Ang_DoorPay.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The player gives Angmar 25 gp in repayment
     for bashing his door.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "AngmarDoorPayment", TRUE);
    TakeGoldFromCreature(25, oPC);
}
