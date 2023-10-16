void main()
{
    object oPC = GetLastPCToCancelCutscene();
    //StopFade(oPC);
    BlackScreen(oPC);
    //FadeToBlack(oPC, FADE_SPEED_FASTEST);
    //DelayCommand(3.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("q2a_enter_player1")));
}
