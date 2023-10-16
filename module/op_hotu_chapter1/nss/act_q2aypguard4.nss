//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Takes shield and 50 gold.
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
    ActionTakeItem(oShield,oPC);
    TakeGoldFromCreature(50,oPC);
    SetLocalInt(OBJECT_SELF, "nGraybanfixed", 1);
}

