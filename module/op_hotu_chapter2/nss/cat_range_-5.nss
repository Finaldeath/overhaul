//::///////////////////////////////////////////////
//:: Catapult: Range Adjustment -5
//:: Cat_Range_-5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Adjust the catapult's range by -5.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iRange = GetLocalInt(oPC, "iRange");
    iRange = iRange - 5;
    SetLocalInt(oPC, "iRange", iRange);
    SetLocalInt(oPC, "bDefaultRange", TRUE);
}
