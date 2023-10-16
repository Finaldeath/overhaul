// on-enter event for hole trigger in gnoll caves

void main()
{
    object oPC = GetClickingObject();

    object oTalker = GetNearestObjectByTag("Q3_HOLE_TALKER");
    AssignCommand(oTalker, ActionStartConversation(oPC));
}
