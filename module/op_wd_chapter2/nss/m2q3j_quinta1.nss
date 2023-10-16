//::///////////////////////////////////////////////
//:: m2q3J Quint Action Script #1
//:: m2q3J_QuintA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a copy of Quint's Oath for the
    player. It is alright to have multiple copies
    in the world.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 29, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("M2Q3_OATHQUINT", oPC);
}

