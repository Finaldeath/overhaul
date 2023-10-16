// Cast Lightning bolt at user

void main()
{
    ActionCastSpellAtObject(SPELL_LIGHTNING_BOLT, GetPCSpeaker(), METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
}
