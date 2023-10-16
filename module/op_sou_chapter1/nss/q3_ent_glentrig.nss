//Have glendir start conversation with the PC

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        //if (GetIsInCombat(oPC) == FALSE)
        //{
            object oGlendir = GetObjectByTag("Q3_GLENDIL");
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oGlendir, ActionStartConversation(oPC));
        //}

    }
}
