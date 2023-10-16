//::///////////////////////////////////////////////
//:: Alias Initiates
//:: q3_init_alias
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oAlias = GetNearestObjectByTag("q2_alias");

    if(GetEnteringObject()== oPC
      && GetIsObjectValid(oAlias))
    {
        AssignCommand(oPC,ClearAllActions(TRUE));
        DelayCommand(0.5,AssignCommand(oAlias,ActionStartConversation(oPC)));
    }
}
