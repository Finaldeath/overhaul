// Cordigan the gnome greets the player

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oGnome = GetNearestObjectByTag("q3_cordigan");
    AssignCommand(oGnome, ClearAllActions());
    PlayVoiceChat(VOICE_CHAT_HELLO, oGnome);
    AssignCommand(oGnome, ActionStartConversation(oPC));

}
