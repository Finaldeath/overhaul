//::///////////////////////////////////////////////
//:: Catapult: Maximum Range Action Script
//:: Cat_Max_Range_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the ctapult's range to its maximum of 30
    meters.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 1, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "iRange", 30);
}
