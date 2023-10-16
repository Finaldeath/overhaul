//::///////////////////////////////////////////////
//:: m2q3I Belial Action Script #1
//:: m2q3I_BelialA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a copy of Belial's Oath for the
    player. It is alright to have multiple copies
    in the world.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 30, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("M2Q3_OATHBELIAL", oPC);
}

