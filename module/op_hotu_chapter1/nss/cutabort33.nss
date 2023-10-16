void main()
{
    object oPC = GetLastPCToCancelCutscene();
    object oWarrior = GetObjectByTag("q2d_warrior1");
    object oWPCheck = GetWaypointByTag("q2d_wp_check");
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(1.0, AssignCommand(oWarrior, ActionMoveToLocation(GetLocation(oWPCheck), TRUE)));
    DelayCommand(1.5, AdjustReputation(oPC, oWarrior, -100));
    DelayCommand(1.5, AdjustReputation(oWarrior, oPC, -100));
    DelayCommand(2.5, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
}
