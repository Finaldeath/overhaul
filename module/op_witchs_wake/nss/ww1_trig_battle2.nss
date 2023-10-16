//::///////////////////////////////////////////////
//:: Witchwork 1: Trigger (Returned To Battlefield By Death #2)
//:: WW1_Trig_Battle2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Resets a local on the player to FALSE,
     thereby indicating to the Ragpicker that the
     player returned by way of foot rather than
     by dying.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    SetLocalInt(oPC, "bReturnedByFoot", TRUE);
}
