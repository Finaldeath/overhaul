// Debris: player sustains 2d6 damages (reflex save for half) - actual damage is on the on-exit event
// (dwarves detect it on the on-enter)

void main()
{
    int nTriggered = GetLocalInt(OBJECT_SELF, "TRIGGERED");
    if(nTriggered == 1)
        return;
    if(GetHasFeat(FEAT_STONECUNNING, GetEnteringObject()))
    {
        AssignCommand(GetEnteringObject(), ClearAllActions());
        //AssignCommand(GetEnteringObject(), PlayVoiceChat(VOICE_CHAT_LOOKHERE));
        AssignCommand(GetEnteringObject(), SpeakOneLinerConversation("q3d_debris"));
        SetLocalInt(OBJECT_SELF, "PLAYERS_AWARE_OF_DEBRIS", 1);
    }
}
