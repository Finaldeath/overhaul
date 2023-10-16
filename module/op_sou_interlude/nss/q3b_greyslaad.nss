void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oGuard = GetNearestObjectByTag("NW_SLAADGRAY");
    DelayCommand(1.0, PlayVoiceChat(VOICE_CHAT_BATTLECRY1, oGuard));
    AssignCommand(oGuard, ActionAttack(oPC));
}
