//::///////////////////////////////////////////////
//:: Name: act_q2dhal_tomi
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Remove Tomi from the PCs party
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////

#include "x0_i0_henchman"
void main()
{
    object oPC = GetPCSpeaker();
    string szTomi = "x2_hen_tomi";
    object oTomi = GetHenchman(oPC, 1);
    if (GetTag(oTomi) != szTomi)
        oTomi = GetHenchman(oPC, 2);
    FireHenchman(oPC, oTomi);
}
