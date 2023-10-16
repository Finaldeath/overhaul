// Cure's Talona's disease from the temple on all creatures affected in the area.

void main()
{
    object oPC = GetItemActivator();
    if(oPC == OBJECT_INVALID)
        oPC = GetFirstPC();
    effect eVis = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);
    object oArea = GetObjectByTag("q6e_ShaorisFellTemple");
    effect eEff;

    object oCreature = GetFirstObjectInArea(GetArea(oPC));
    while(oCreature != OBJECT_INVALID)
    {
        if(GetLocalInt(oCreature, "Q6E_DISEASE_STAGE") != 0)
        {
            SetLocalInt(oCreature, "Q6E_DISEASE_STAGE", 0);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oCreature);
            eEff = GetFirstEffect(oCreature);
            while(GetIsEffectValid(eEff))
            {
                if(GetEffectCreator(eEff) == oArea || GetEffectType(eEff) == EFFECT_TYPE_SPELL_FAILURE)
                    RemoveEffect(oCreature, eEff);
                eEff = GetNextEffect(oCreature);
            }
        }
        oCreature = GetNextObjectInArea(GetArea(oPC));
    }
    SetPlotFlag(OBJECT_SELF, FALSE);
    DestroyObject(OBJECT_SELF, 1.0);

}
