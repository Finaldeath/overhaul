// unsummons any familiar, companion or summoned creature

void main()
{
    object oPC = GetPCSpeaker();
    object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ActionPauseConversation();
    if (GetIsObjectValid(oCompanion))
    {
        DelayCommand(0.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oCompanion)));
        DelayCommand(1.0, DestroyObject(oCompanion));

        //DelayCommand(1.0, AssignCommand(oCompanion, ActionDoCommand(oPC, oCompanion));

    }
    if (GetIsObjectValid(oFamiliar))
    {
        DelayCommand(0.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oFamiliar)));
        DelayCommand(1.0, DestroyObject(oFamiliar));
    }
    if (GetIsObjectValid(oDominated))
    {
        DelayCommand(0.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oDominated)));
        DelayCommand(1.0, DestroyObject(oDominated));
    }
    if (GetIsObjectValid(oSummon))
    {
        DelayCommand(0.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oSummon)));
        DelayCommand(1.0, DestroyObject(oSummon));
    }
    DelayCommand(1.5, ActionResumeConversation());
}
