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
//    object oHide = GetItemPossessedBy(GetFirstPC(),"os_wolfpelt");
    object oPC = GetFirstPC();
    os_DestroyItem("os_wolfpelt");
//    ActionTakeItem(oHide,oPC);

    GiveXPToCreature(oPC,25);
    GiveGoldToCreature(oPC,10);
}
