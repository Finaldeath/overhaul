void main()
{
    object oWP = GetNearestObjectByTag("WP_FIREBALL_TEST");

    AssignCommand(OBJECT_SELF, ActionCastSpellAtObject(SPELL_FIREBALL, oWP, METAMAGIC_ANY, TRUE));
}
