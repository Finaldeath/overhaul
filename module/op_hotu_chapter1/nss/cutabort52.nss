void main()
{
    object oPC = GetLastPCToCancelCutscene();
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(2.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    object oDurnan = GetObjectByTag("q2adurnan");
    object oTomi = GetObjectByTag("pre_tomi");
    object oDaelan = GetObjectByTag("pre_daelan");
    object oLinu = GetObjectByTag("pre_linu");
    object oSharwyn = GetObjectByTag("pre_sharwyn");
    location lDurnanMoveWP = GetLocation(GetObjectByTag("bp_cut52_durnanmove_wp"));
    location lPCCopyWP = GetLocation(GetObjectByTag("bp_cut52_pccopystart_wp"));
    object oDoor = GetObjectByTag("welldoor");
    object oBeholder = GetObjectByTag("cut5beholder");
    object oBeholder2 = GetObjectByTag("cut52_beholder");
    object oBrazier = GetObjectByTag("c52_brazier_explode");
    object oFire = GetObjectByTag("cut52_fire");

    AssignCommand(oDurnan, ActionJumpToObject(GetWaypointByTag("wp_cut5bwell_durnan")));
    DestroyObject(oTomi);
    DestroyObject(oDaelan);
    DestroyObject(oLinu);
    DestroyObject(oSharwyn);
    DestroyObject(oBeholder);
    //SetPlotFlag(oBeholder, FALSE);
    DestroyObject(oBeholder2);

    AssignCommand(oDurnan, ClearAllActions());
    AssignCommand(oDurnan, ActionJumpToLocation(lDurnanMoveWP));
    AssignCommand(oPC, ActionJumpToLocation(lPCCopyWP));
    AssignCommand(oDoor, ActionCloseDoor(OBJECT_SELF));

    DestroyObject(oTomi);
    DestroyObject(oLinu);
    DestroyObject(oSharwyn);
    DestroyObject(oDaelan);
    DestroyObject(oBrazier);
    DestroyObject(oFire);

    MusicBackgroundStop(GetArea(oPC));
    MusicBackgroundChangeNight(GetArea(oPC), 54);
    DelayCommand(0.2, MusicBackgroundPlay(GetArea(oPC)));
}
