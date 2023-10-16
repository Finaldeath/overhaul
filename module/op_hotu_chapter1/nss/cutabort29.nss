//cutabort29
void main()
{
    object oPC = GetLastPCToCancelCutscene();
    object oArea = GetArea(oPC);

    BlackScreen(oPC);
    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    object oDrowLookout = GetObjectByTag("q2d_cutdrow_lookout1");
    object oMinoBrute = GetObjectByTag("q2d_cutdrow_mino1");
    object oSlaveLeader = GetObjectByTag("q2d_cutform_slaveboss");
    object oGuard1 = GetObjectByTag("q2d_cutdrow_guard3");
    object oGuard2 = GetObjectByTag("q2d_cutdrow_guard4");
    object oGuard3 = GetObjectByTag("q2d_cutdrow_guard5");
    object oGuard4 = GetObjectByTag("q2d_cutdrow_guard6");
    object oMagus = GetObjectByTag("q2d_cutdrow_magus1");
    object oMarksman = GetObjectByTag("q2d_cutdrow_archer1");

    //locations
    object oMino1 = GetWaypointByTag("wp_q2d_cutmino1");
    object oPCEnd = GetWaypointByTag("wp_q2dcut19_pcend");
    object oSlave1 = GetWaypointByTag("wp_q2d_cutslave1");
    object oGuard1a = GetWaypointByTag("wp_q2d_cutdrow_guard3_2");
    object oGuard2a = GetWaypointByTag("wp_q2d_cutdrow_guard4_2");
    object oGuard3a = GetWaypointByTag("wp_q2d_cutdrow_guard5_2");
    object oGuard4a = GetWaypointByTag("wp_q2d_cutdrow_guard6_1");
    object oArcher1 = GetWaypointByTag("wp_q2d_cutdrow_archer1_1");
    object oMagus1 = GetWaypointByTag("wp_q2d_cutdrow_magus1_1");

    //Move everyone to their final locations
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, JumpToObject(oPCEnd));

    AssignCommand(oDrowLookout, ClearAllActions());
    AssignCommand(oDrowLookout, JumpToObject(oMino1));

    AssignCommand(oMinoBrute, ClearAllActions());
    AssignCommand(oMinoBrute, JumpToObject(oMino1));

    AssignCommand(oGuard1, ClearAllActions());
    AssignCommand(oGuard1, JumpToObject(oGuard1a));

    AssignCommand(oGuard2, ClearAllActions());
    AssignCommand(oGuard2, JumpToObject(oGuard2a));

    AssignCommand(oGuard3, ClearAllActions());
    AssignCommand(oGuard3, JumpToObject(oGuard3a));

    AssignCommand(oGuard4, ClearAllActions());
    AssignCommand(oGuard4, JumpToObject(oGuard4a));

    AssignCommand(oMarksman, ClearAllActions());
    AssignCommand(oMarksman, JumpToObject(oArcher1));

    AssignCommand(oMagus, ClearAllActions());
    AssignCommand(oMagus, JumpToObject(oMagus1));

    AssignCommand(oSlaveLeader, ClearAllActions());
    AssignCommand(oSlaveLeader, JumpToObject(oSlave1));

    SignalEvent(oArea, EventUserDefined(201));
}
