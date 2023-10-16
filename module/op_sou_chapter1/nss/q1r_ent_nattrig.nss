//::///////////////////////////////////////////////
//:: Name  q1r_ent_nattrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    have Nathan Hurst start a conversation with
    the PC entering the trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 7/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        if (GetIsInCombat(oPC) == FALSE)
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            object oNathan = GetObjectByTag("q1ruralnathan");
            AssignCommand(oNathan, SpeakStringByStrRef(40345));
            AssignCommand(oNathan, ActionStartConversation(oPC));
        }
    }
}
