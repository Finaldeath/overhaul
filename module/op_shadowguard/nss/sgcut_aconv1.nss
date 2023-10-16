//Setup the ghost judgement
void CreateYakir(location lPosition)
{
    CreateObject(OBJECT_TYPE_CREATURE, "ac_yakirghost", lPosition);
}

void main()
{
    object oPC = GetFirstPC();
    object oJarvis = GetNearestObjectByTag("CT_UNIQ_SH_INST", oPC);
    object wpYakir = GetWaypointByTag("SGCUT_YAKIR");
    effect eSummon = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);

    ActionPauseConversation();

    AssignCommand(oPC, SetCameraFacing(350.0f, 12.0f, 60.0f,
        CAMERA_TRANSITION_TYPE_FAST));

    AssignCommand(oJarvis, DelayCommand(1.3f,
        ActionCastFakeSpellAtObject(SPELL_SUMMON_CREATURE_V, wpYakir)));

    DelayCommand(2.1f, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSummon, GetLocation(wpYakir)));
    DelayCommand(2.3f, CreateYakir(GetLocation(wpYakir)));

    DelayCommand(3.2f, ActionResumeConversation());
    DelayCommand(5.0f, SetFacingPoint(GetPosition(oPC)));
}
