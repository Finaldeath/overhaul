//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets that someone bought the cloak, takes 5000 gold
     from PC, gives pc the cloak.

     10000 gp - bk
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oPC = GetPCSpeaker();
    CreateItemOnObject("x2cloakbedazzle", oPC);

    ArgaliSoldItemNow(oPC);
    TakeGoldFromCreature(10000,oPC);

}
