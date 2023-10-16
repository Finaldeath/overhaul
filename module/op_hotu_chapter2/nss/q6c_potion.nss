// Medusa potion: drinking this potion would allow the player to talk to the medusa

void main()
{
    object oPC = GetItemActivator();
    effect eVis = EffectVisualEffect(VFX_IMP_MAGICAL_VISION);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    object oMedusa = GetObjectByTag("q6_quathala");
    if(oMedusa != OBJECT_INVALID)
    {
        AssignCommand(oMedusa, SurrenderToEnemies());
        SetPlotFlag(OBJECT_SELF, FALSE);
        DestroyObject(OBJECT_SELF, 1.0);
    }
}
