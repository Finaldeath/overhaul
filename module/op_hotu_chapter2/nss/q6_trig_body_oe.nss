// pop up a message when approaching a body that has been looted by the drow

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    if(GetLocalInt(GetArea(OBJECT_SELF), "SHARD_TAKEN") == 1)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        AssignCommand(oPC, SpeakOneLinerConversation("q6_shard_body"));

    }
}
