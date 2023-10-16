// abort script for matron's cutscene when summoning the player

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    // kill all guards
    object oGuard1 = GetObjectByTag("q7_guard1");
    object oGuard2 = GetObjectByTag("q7_guard2");
    object oGuard3 = GetObjectByTag("q7_guard3");
    object oGuard4 = GetObjectByTag("q7_guard4");
    object oGuard5 = GetObjectByTag("q7_guard5");
    object oGuard6 = GetObjectByTag("q7_guard6");
    object oGuard7 = GetObjectByTag("q7_guard7");
    DestroyObject(oGuard1);
    DestroyObject(oGuard2);
    DestroyObject(oGuard3);
    DestroyObject(oGuard4);
    DestroyObject(oGuard5);
    DestroyObject(oGuard6);
    DestroyObject(oGuard7);
    //Destroy summoning circle:
    object oCircle = GetObjectByTag("q7b_circle");
    DestroyObject(oCircle);
    // jump player
    object oPCJump = GetWaypointByTag("q7b_wp_pc_sp");
    DelayCommand(1.5, AssignCommand(oPC, JumpToObject(oPCJump)));
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(3.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    object oMatron = GetObjectByTag("q7_matron");
    object oWP = GetWaypointByTag("q7_wp_matron_run");
    DelayCommand(1.5, AssignCommand(oMatron, JumpToObject(oWP)));
    DelayCommand(2.0, SignalEvent(oMatron, EventUserDefined(101)));
    AdjustReputation(oPC, oMatron, -100);
    AdjustReputation(oMatron, oPC, -100);
}
