//::///////////////////////////////////////////////
//:: Name q1r_ent_rebdntrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have Becka start a conversation with the PC
    after she escapes
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 18/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
int GetIsInTrigger(object oTrigger, object oCreature);

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        object oRebecca = GetObjectByTag("q1ruralrebecca");
        object oRebTrig = GetObjectByTag("q1r_rebdone_trig");
        if (GetIsInTrigger(oRebTrig, oRebecca) == TRUE)
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            AssignCommand(oRebecca, ActionStartConversation(oPC));
        }
    }
}

int GetIsInTrigger(object oTrigger, object oCreature)
{
    object oTest = GetFirstInPersistentObject(oTrigger);
    while (oTest != OBJECT_INVALID)
    {
        if (GetName(oCreature) == GetName(oTest))
            return TRUE;
        oTest = GetNextInPersistentObject(oTrigger);
    }
    return FALSE;
}
