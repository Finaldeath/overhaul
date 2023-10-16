//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets Buck as sad, takes shield and gives player 50 gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oPC = (GetPCSpeaker());
    object oShield = GetObjectByTag("graybansshield");
    BuckNowSad(GetPCSpeaker());
    ActionTakeItem(oShield,oPC);
    GiveGoldToCreature(oPC,50);
}
