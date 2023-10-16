void main()
{
    AssignCommand(GetNearestObjectByTag("M1S4BKeener"),DelayCommand(IntToFloat(Random(6)),SpeakOneLinerConversation()));
    AssignCommand(GetNearestObjectByTag("M1S4BKeener1"),
                  DelayCommand(IntToFloat(Random(6)),
                              ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2)));
    AssignCommand(GetNearestObjectByTag("M1S4BKeener2"),
                  DelayCommand(IntToFloat(Random(6)),
                              ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3)));
}

