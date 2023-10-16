// on-enter event for hole trigger in gnoll caves

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    object oTalker = GetNearestObjectByTag("Q3_HOLE_TALKER");
    AssignCommand(oTalker, ActionStartConversation(oPC));
}
