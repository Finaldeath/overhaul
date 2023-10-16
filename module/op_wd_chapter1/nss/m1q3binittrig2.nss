// this is the on enter script if a trigger that encompasses the NPC who will be
//initiating dialouge. Make sure to replace the value of sTag with the tag of
//the NPC in question.
void main()
{
    string sTag = "M1Q3ADUMBGUA";
    object oNPC = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + sTag);
    object oPC = GetEnteringObject();
//    SpeakString(IntToString(GetLocalInt(oPC,"NW_L_Init_" + sTag)));
    if(GetIsPC(oPC) &&
       GetLocalInt(oPC,"NW_L_Init_" + sTag) == FALSE &&
       IsInConversation(oNPC) == FALSE &&
       GetLocalInt(oNPC,"NW_L_UNLOCKING") == FALSE &&
       GetObjectSeen(oPC,oNPC))
    {
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oNPC,ClearAllActions());
        AssignCommand(oNPC,ActionStartConversation(oPC));
    }
}
