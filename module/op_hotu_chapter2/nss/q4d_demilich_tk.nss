// Demilich talk trigger

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oDemilich = GetNearestObjectByTag("q4d_maker");
    if(!GetIsInCombat(oDemilich))
    {
        AssignCommand(oDemilich, PlayVoiceChat(VOICE_CHAT_HELLO));
        AssignCommand(oDemilich, ActionStartConversation(oPC));
    }
}
