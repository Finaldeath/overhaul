//::///////////////////////////////////////////////
//:: Magic Weapon Initiates
//:: q2_init_mwyenna
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The magic weapon initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

#include "os_include"
#include "inc_remeffect"


void main()
{
    object oPC = GetFirstPC();
    object oYenna = GetObjectByTag("q2_yenna");

    if(GetExitingObject()== oPC
        && !os_CheckTriggerEntered()
        && GetLocalInt(oYenna,"OS_YENNA_EAVESDROP")==10)
    {
        RemovePoly(oPC);

        location lPC = GetLocation(oPC);
        object oMW = CreateObject(OBJECT_TYPE_PLACEABLE,"q3ai_mw_intro",lPC);

        AssignCommand(oPC,ClearAllActions(TRUE));
        SetLocalInt(oMW,"OS_MW_YENNA",1);
        os_SetTriggerEntered();
        DelayCommand(1.0,AssignCommand(oMW,ActionStartConversation(oPC)));
    }
}
