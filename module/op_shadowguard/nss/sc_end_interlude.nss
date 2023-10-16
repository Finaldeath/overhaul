void main()
{
    object oPC = GetPCSpeaker();

    FadeToBlack(oPC, FADE_SPEED_FAST);

    object oWP = GetWaypointByTag("WP_STAGE_1_JUMP");

    location lWP = GetLocation(oWP);

    AssignCommand(oPC, DelayCommand(5.0, JumpToLocation(lWP)));
}
