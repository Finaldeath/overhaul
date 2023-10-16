//::///////////////////////////////////////////////
//:: Speak True Name (Action)
//:: A_True_valen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Plays the True Name VFX on the NPC being
     spoken to.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
#include "x2_inc_toollib"
void main()
{
    object oHench = GetNearestObjectByTag("x2_hen_valen", GetPCSpeaker());

    TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oHench), 4, 0.1, 6.0, -2.0);

    SetLocalInt(GetModule(), "bValenNameUsed", TRUE);
}
