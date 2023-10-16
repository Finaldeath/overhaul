// Cast Sound Burst at user

void main()
{
    ActionCastSpellAtObject(SPELL_SOUND_BURST, GetPCSpeaker(), METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
}
