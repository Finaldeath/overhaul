// bugs trap -> all statues breath clouds of stinging bugs and Kel-Garas appears to attack for a few rounds

void RemoveStone(object oStatue)
{
    SetPlotFlag(oStatue, FALSE);

    effect eHold = GetFirstEffect(oStatue);
    while (GetIsEffectValid(eHold))
    {
        if(GetEffectType(eHold) == EFFECT_TYPE_PETRIFY)
        {
            RemoveEffect(oStatue, eHold);
            effect eVis = EffectVisualEffect(VFX_DUR_PETRIFY);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oStatue);
            return;
        }
        eHold = GetNextEffect(oStatue);
     }

}

void Stone(object oStatue)
{
    effect eStone = EffectPetrify();
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStone, oStatue);
    SetPlotFlag(oStatue, TRUE);
}

void BreathCloud(object oStatue, object oTarget)
{
    RemoveStone(oStatue);
    //AssignCommand(oStatue, ActionDoCommand(RemoveStone(oStatue)));
    string sTag = "Q2D_BUG_CASTER" + GetStringRight(GetTag(oStatue), 1);
    object oCaster = GetNearestObjectByTag(sTag);
    AssignCommand(oStatue, ActionCastFakeSpellAtObject(SPELLABILITY_GOLEM_BREATH_GAS, oTarget));
    AssignCommand(oCaster, ActionCastSpellAtLocation(SPELL_CREEPING_DOOM, GetLocation(oTarget),
                    METAMAGIC_ANY, TRUE,PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    DelayCommand(1.5, Stone(oStatue));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    effect eAOE = EffectAreaOfEffect(AOE_PER_CREEPING_DOOM);

    object oMinotaur1 = GetObjectByTag("Q2D_MINOTAUR1");
    object oMinotaur2 = GetObjectByTag("Q2D_MINOTAUR2");
    object oMinotaur3 = GetObjectByTag("Q2D_MINOTAUR3");
    object oMinotaur4 = GetObjectByTag("Q2D_MINOTAUR4");

    object oTarget1 = GetObjectByTag("Q2D_WP_BREATH1");
    object oTarget2 = GetObjectByTag("Q2D_WP_BREATH2");
    object oTarget3 = GetObjectByTag("Q2D_WP_BREATH3");
    object oTarget4 = GetObjectByTag("Q2D_WP_BREATH4");


    BreathCloud(oMinotaur1, oTarget1);
    BreathCloud(oMinotaur2, oTarget2);
    BreathCloud(oMinotaur3, oTarget3);
    BreathCloud(oMinotaur4, oTarget4);

    //DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oTarget1), RoundsToSeconds(10)));
    //DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oTarget2), RoundsToSeconds(10)));
    //DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oTarget3), RoundsToSeconds(10)));
    //DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oTarget4), RoundsToSeconds(10)));

    object oSound1 = GetObjectByTag("Q2D_SOUND_BUGS1");
    object oSound2 = GetObjectByTag("Q2D_SOUND_BUGS2");
    object oSound3 = GetObjectByTag("Q2D_SOUND_BUGS3");
    object oSound4 = GetObjectByTag("Q2D_SOUND_BUGS4");
    DelayCommand(0.5, SoundObjectPlay(oSound1));
    DelayCommand(0.5, SoundObjectPlay(oSound2));
    DelayCommand(0.5, SoundObjectPlay(oSound3));
    DelayCommand(0.5, SoundObjectPlay(oSound4));
    DelayCommand(RoundsToSeconds(10), SoundObjectStop(oSound1));
    DelayCommand(RoundsToSeconds(10), SoundObjectStop(oSound2));
    DelayCommand(RoundsToSeconds(10), SoundObjectStop(oSound3));
    DelayCommand(RoundsToSeconds(10), SoundObjectStop(oSound4));
    // its time to bring the bad guy for a couple of rounds
    object oKelGaras = GetObjectByTag("Q2_KELGARAS");
    SetLocalInt(oKelGaras, "FIRST_BATTLE", 1);
    DelayCommand(1.0, SignalEvent(oKelGaras, EventUserDefined(101)));
    DelayCommand(3.0, AssignCommand(oPC, PlaySound("c_mummygrt_bat1")));
}
