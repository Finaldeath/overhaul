// Cast Lightning bolt at user

void main()
{
    ActionCastSpellAtObject(SPELL_HEALING_CIRCLE, GetPCSpeaker(), METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
}
