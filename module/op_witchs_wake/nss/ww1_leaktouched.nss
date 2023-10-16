//::///////////////////////////////////////////////
//:: Witchwork: Ethereal Leak, Touched
//:: WW1_LeakTouched.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags this player as having touched the
     ethereal leak. This is only used for the
     conversation with the Night Hag in her home.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 21, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "CONV_LEAK_Touched", TRUE);
}
