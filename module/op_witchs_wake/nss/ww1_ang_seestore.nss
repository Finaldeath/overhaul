//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar, See Store
//:: WW1_Ang_SeeStore
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having been pointed
     toward the store (the View store option will
     now appear).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_ANGMAR_SeeStore", TRUE);
}
