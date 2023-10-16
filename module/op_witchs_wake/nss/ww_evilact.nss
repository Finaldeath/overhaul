//::///////////////////////////////////////////////
//:: Witch Wake: Evil Act
//:: WW_EvilAct.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes paladins to fall. Only to be used in
     conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 1, 2002
//:://////////////////////////////////////////////
#include "ww1_inc_paladin"

void main()
{
    object oPC = GetPCSpeaker();
    PaladinFalls(oPC);
}
