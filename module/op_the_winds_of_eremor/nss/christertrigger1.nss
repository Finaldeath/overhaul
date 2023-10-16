// this is the on enter script if a trigger that encompasses the NPC who will be
//initiating dialouge. Make sure to replace the value of sTag with the tag of
//the NPC in question.
void main()
{
    int iDoOnce = GetLocalInt(OBJECT_SELF, "DoOnce");

    if (iDoOnce == FALSE)
    {
        string sTag = "Christer";
        object oNPC = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + sTag);
        object oPC = GetEnteringObject();

        if(GetIsPC(oPC) &&
           GetLocalInt(oPC,"NW_L_Init" + GetTag(oNPC)) == FALSE &&
           IsInConversation(oNPC) == FALSE)
        {
            AssignCommand(oPC,ClearAllActions());
            AssignCommand(oNPC,ClearAllActions());
            AssignCommand(oNPC,ActionMoveToObject(oPC));
            AssignCommand(oNPC,ActionStartConversation(oPC));
            SetLocalInt(OBJECT_SELF, "DoOnce", TRUE);
        }
    }
}

