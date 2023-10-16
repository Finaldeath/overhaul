void main()
{
    object oTarget = GetPCSpeaker();

    AdjustReputation(oTarget,OBJECT_SELF,-100);
    ActionAttack(oTarget);
    DelayCommand(1.0,SpeakString("NW_CALL_TO_ARMS",TALKVOLUME_SILENT_SHOUT));
}
