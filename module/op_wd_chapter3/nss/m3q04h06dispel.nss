// * dispels magic
void main()
{
    object oTarget = GetLastOpenedBy();
    AssignCommand(GetNearestObjectByTag("M3Q04_CastSpell"), ActionCastSpellAtObject(SPELL_FIREBALL, oTarget, METAMAGIC_ANY,  TRUE));
}
