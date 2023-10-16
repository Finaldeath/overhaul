//::///////////////////////////////////////////////
//:: Name x2_ent_listentrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Listen check: Check for the nearest object with
    the tag x2_dialog and start a conversation with
    it if the listen check is successful.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On: July 14/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        if (GetIsSkillSuccessful(oPC, SKILL_LISTEN, 15) == TRUE)
        {
            AssignCommand(oPC, ClearAllActions(TRUE));
            object oDialog = GetNearestObjectByTag("x2_dialog", oPC);
            AssignCommand(oDialog, ActionStartConversation(oPC));
        }
    }

}
