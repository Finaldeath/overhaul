// * Player broke conversation   with Morag
// * Morag goes hostile and attacks
void BreakEggSac()
{
    object oCoccoon = GetObjectByTag("m4sac1");
    if (GetIsObjectValid(oCoccoon) == TRUE)
    {   ClearAllActions();
        PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
        ActionCastFakeSpellAtLocation(SPELL_FIREBALL, GetLocation(oCoccoon));
        DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamage(100), oCoccoon));
    }
}

void main()
{
    SetPlotFlag(OBJECT_SELF, FALSE);

    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
    SpeakOneLinerConversation();
    effect eVis = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, GetLocation(OBJECT_SELF));
    ClearAllActions();
    ActionCastSpellAtObject(SPELL_PREMONITION, OBJECT_SELF, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);

    ActionJumpToObject(GetNearestObjectByTag("WP_MORAG_THRONE"));
    ActionDoCommand(BreakEggSac());
    ActionDoCommand(SetCommandable(TRUE, OBJECT_SELF));
    SetCommandable(FALSE);
}
