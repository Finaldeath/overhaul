// kel-garas casts slay-living

void main()
{
    object oKelGaras = GetNearestObjectByTag("Q2_KELGARAS");
    if(oKelGaras != OBJECT_INVALID)
    {
        AssignCommand(oKelGaras, ClearAllActions());
        AssignCommand(oKelGaras, ActionCastSpellAtObject(SPELL_SLAY_LIVING, GetLastOpenedBy(), METAMAGIC_ANY, TRUE/*, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE*/));
    }
}
