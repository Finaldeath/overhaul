//::///////////////////////////////////////////////
//:: Snivel Initiates
//:: q3_init_snivel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Snivel initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oSnivel = GetNearestObjectByTag("q3_kob_honey");
    if(GetEnteringObject()== oPC
      && GetIsObjectValid(oSnivel)
      && GetLocalInt(oPC,"OS_KOBOLD_HONEY")!=10)
    {
        AssignCommand(oPC,ClearAllActions(TRUE));
        DelayCommand(0.5,AssignCommand(oSnivel,ActionStartConversation(oPC)));
    }
}
