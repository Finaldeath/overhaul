//::///////////////////////////////////////////////
//:: Witchwork 1: Trigger (Returned To Battlefield By Death #1)
//:: WW1_Trig_Battle1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets a local on the player that will get set
     back to FALSE if the player returns to the
     Battlefield by foot. If it doesn't get reset,
     the Ragpicker can assume you travelled back
     by dying.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 20, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    SetLocalInt(oPC, "bReturnedByFoot", FALSE);
}
