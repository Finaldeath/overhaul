// Monk stands up and inits dialog with the player

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    object oMonk1 = GetNearestObjectByTag("q3_CultMonk1");
    //object oMonk2 = GetNearestObjectByTag("q3_CultMonk2");
    //object oMonk3 = GetNearestObjectByTag("q3_CultMonk3");

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    if(oMonk1 == OBJECT_INVALID || GetIsInCombat(oMonk1))
        return;


    AssignCommand(oPC, ClearAllActions());
    DelayCommand(1.0, AssignCommand(oMonk1, PlayAnimation(ANIMATION_LOOPING_PAUSE, 0.8)));
    DelayCommand(3.0, AssignCommand(oMonk1, Talk(oPC)));

    //DelayCommand(2.0, AssignCommand(oMonk2, PlayAnimation(ANIMATION_LOOPING_PAUSE, 0.5, 3.0)));
    //DelayCommand(2.0, AssignCommand(oMonk3, PlayAnimation(ANIMATION_LOOPING_PAUSE, 0.5, 3.0)));
}
