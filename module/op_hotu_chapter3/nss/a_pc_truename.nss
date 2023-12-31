//::///////////////////////////////////////////////
//:: Speak Player's True Name (Action)
//:: A_PC_TrueName.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Plays the True Name VFX on the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: September 8, 2003
//:://////////////////////////////////////////////
#include "x2_inc_toollib"
void main()
{
    //Make it pretty
    object oPC = GetPCSpeaker();
    if(GetTag(GetArea(oPC)) == "Waterdeep")
    {
        MusicBackgroundStop(GetArea(oPC));
        MusicBackgroundChangeDay(GetArea(oPC), 40);
        MusicBackgroundChangeNight(GetArea(oPC), 40);
        DelayCommand(0.2, MusicBackgroundPlay(GetArea(oPC)));
        NightToDay(oPC, 2.0);
    }
    TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oPC), 4, 0.1, 6.0, -2.0);
}
