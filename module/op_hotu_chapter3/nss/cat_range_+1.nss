//::///////////////////////////////////////////////
//:: Catapult: Range Adjustment +1
//:: Cat_Range_+1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Adjust the catapult's range by +1.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iRange = GetLocalInt(oPC, "iRange");
    iRange = iRange + 1;
    SetLocalInt(oPC, "iRange", iRange);
    SetLocalInt(oPC, "bDefaultRange", TRUE);
}
