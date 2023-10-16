//::///////////////////////////////////////////////
//:: Catapult: Minimum Range Action Script
//:: Cat_Min_Range_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the ctapult's range to its minimum of 3
    meters.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 1, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "iRange", 3);
}
