//::///////////////////////////////////////////////
//:: Magic Weapon Initiates
//:: q3_init_mwreveal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The magic weapon initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
#include "inc_remeffect"

void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()== oPC
        && !os_CheckTriggerEntered())
    {
        RemovePoly(oPC);

        location lPC = GetLocation(oPC);
        object oMW = CreateObject(OBJECT_TYPE_PLACEABLE,"q3ai_mw_intro",lPC);

        AssignCommand(oPC,ClearAllActions(TRUE));
        SetLocalInt(oMW,"OS_MW_REVEAL",1);
        os_SetTriggerEntered();
        DelayCommand(1.0,AssignCommand(oMW,ActionStartConversation(oPC)));
    }
}
