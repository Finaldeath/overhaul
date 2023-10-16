// abort script for gelly cube cutscene

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    object oCube = GetObjectByTag("bk_gel_cube");
    object oCubeGoTo2 = GetWaypointByTag("bk_wp_cube_goto2");
    object oScout = GetObjectByTag("bk_DrowScout2");

    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(2.5, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
    SetCreatureAppearanceType(oScout, APPEARANCE_TYPE_SKELETON_COMMON);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oScout);
    AssignCommand(oCube, JumpToObject(oCubeGoTo2));
    AdjustReputation(oPC, oCube, -50);
    AdjustReputation(oCube, oPC, -50);

}
