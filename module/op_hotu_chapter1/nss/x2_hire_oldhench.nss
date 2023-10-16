//:://////////////////////////////////////////////////
//:: X2_Hire_Oldhench
//:: Copyright (c) 2003 Bioware
//:://////////////////////////////////////////////////
/*
Handles the hiring of a henchman. - specifically,
Linu, Tomi, Sharwyn, Daelan and Deekin
These henchmen must be destroyed before being hired.
 */
//:://////////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 24/03
//:://////////////////////////////////////////////////

#include "x0_i0_henchman"

void main()
{
    //HireHenchman(GetPCSpeaker(), OBJECT_SELF);
    ExecuteScript("x0_d1_hen_hired", OBJECT_SELF);
/*    //Destroy the old henchman that was used in all the cutscenes
    SetIsDestroyable(TRUE);
    DestroyObject(OBJECT_SELF, 0.5);
    object oPC = GetPCSpeaker();
    //Create the new henchman from the palette
    object oHench = CreateObject(OBJECT_TYPE_CREATURE, GetTag(OBJECT_SELF) + "2", GetLocation(OBJECT_SELF));
    HireHenchman(oPC, oHench);    */
}
