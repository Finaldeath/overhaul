//::///////////////////////////////////////////////
//:: Name: act_q2dhal_shar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Remove Sharwyn from the PCs party
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 15/03
//:://////////////////////////////////////////////

#include "x0_i0_henchman"
void main()
{
    object oPC = GetPCSpeaker();
    string szHench = "x2_hen_sharwyn";
    object oHench = GetHenchman(oPC, 1);
    if (GetTag(oHench) != szHench)
        oHench = GetHenchman(oPC, 2);
    FireHenchman(oPC, oHench);
}
