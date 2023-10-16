// A ranger detects tracks in the dust of the path puzzle area.

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC) || GetLevelByClass(CLASS_TYPE_RANGER, oPC) == 0)
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    AssignCommand(oPC, SpeakOneLinerConversation("q3b_ranger_clue"));
}
