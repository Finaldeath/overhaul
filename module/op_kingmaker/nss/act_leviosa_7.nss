//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     take hide,give little xp, give gold
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 3, 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
//    object oHide = GetItemPossessedBy(GetFirstPC(),"os_bearskin");
    object oPC = GetFirstPC();
    os_DestroyItem("os_bearskin");
//    ActionTakeItem(oHide,oPC);

    GiveXPToCreature(oPC,50);
    GiveGoldToCreature(oPC,20);
}
