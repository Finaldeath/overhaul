//::///////////////////////////////////////////////
//:: Name  q1b_ent_gatetrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Start a conversation with the hilltop
        gate guard when this trigger is entered.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 18/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oGuard = GetObjectByTag("q1bgateguard");
        AssignCommand(oGuard, ActionStartConversation(oPC));
    }

}
