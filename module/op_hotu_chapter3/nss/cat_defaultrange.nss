//::///////////////////////////////////////////////
//:: Catapults!: Catapult Default Range
//:: Cat_DefaultRange.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player has not yet set a range, default
    to 15.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iDefault = GetLocalInt(oPC, "bDefaultRange");

    //If the range hasn't been set, use the default of 15.
    if (iDefault == FALSE)
    {
        SetLocalInt(oPC, "iRange", 15);
        SetLocalInt(oPC, "bDefaultRange", TRUE);
    }
}
