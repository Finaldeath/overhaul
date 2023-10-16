//::///////////////////////////////////////////////
//:: Name q1h_ent_ktrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Entering the trigger in the upstairs of the
        Blake house will start the conversation
        with the kobold who is holding the baby
        hostage. (Actually use an invisible object
        for the conversation).
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) && GetLocalInt(OBJECT_SELF, "nTriggered") == 0 && GetIsObjectValid(GetObjectByTag("q1h2_kblake")) == TRUE)
    {
        object oDialog = GetObjectByTag("q1hdialog");
        object oKobold = GetObjectByTag("q1h2_kblake");
        object oCradle = GetObjectByTag("q1hcradle");
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oKobold, ActionMoveToObject(oCradle, TRUE));
        DelayCommand(0.5, AssignCommand(oKobold, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW)));
        DelayCommand(1.3, AssignCommand(oKobold, ActionMoveToObject(oPC)));
        DelayCommand(1.6, AssignCommand(oKobold, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1)));
        DelayCommand(1.7, AssignCommand(oDialog, ActionStartConversation(oPC)));

    }
    else if (GetIsPlayerCharacter(oPC) && GetLocalInt(OBJECT_SELF, "nTriggered") == 2)
    {
        object oDialog1 = GetObjectByTag("q1hdialog");
        object oKobold1 = GetObjectByTag("q1h2_kblake");
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(1.5, AssignCommand(oKobold1, ActionMoveToObject(oPC)));
        DelayCommand(1.5, AssignCommand(oDialog1, ActionStartConversation(oPC)));
    }

}
