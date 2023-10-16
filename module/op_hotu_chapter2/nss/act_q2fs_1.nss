//All the other Duergar laugh
void main()
{
    object oDuergar1 = GetObjectByTag("q2fs_rogue1");
    object oDuergar2 = GetObjectByTag("q2fs_rogue2");
    object oDuergar3 = GetObjectByTag("q2fs_rogue3");

    PlayVoiceChat(VOICE_CHAT_LAUGH, oDuergar1);
    PlayVoiceChat(VOICE_CHAT_LAUGH, oDuergar2);
    PlayVoiceChat(VOICE_CHAT_LAUGH, oDuergar3);

    AssignCommand(oDuergar1, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 2.0));
    DelayCommand(0.2, AssignCommand(oDuergar2, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 2.0)));
    DelayCommand(0.5, AssignCommand(oDuergar3, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 2.0)));


}
