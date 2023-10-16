void FallDown(object o)
{
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL), GetLocation(o));

    if ((GetIsPC(o) == TRUE) || (GetObjectType(o) == OBJECT_TYPE_CREATURE))
    {
        DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_DAZED_S), o));
        DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_WEB), o));

        if ((GetIsPC(o) == FALSE))
        {
            DelayCommand(0.6f, AssignCommand(o, ClearAllActions()));
            DelayCommand(1.5f, AssignCommand(o, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK, 1.0f, 10.0f)));
            //DelayCommand(0.5f, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), o));
        }
    }
}

void main()
{
    ActionPauseConversation();

    object oPC = GetPCSpeaker();

    // Cast for cutscene
    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM");
    object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK");
    object oMarkius = GetNearestObjectByTag("HENCH_MARK");
    object oLyen = GetNearestObjectByTag("HENCH_LYEN");
    object oKara = GetNearestObjectByTag("HENCH_KARA");
    object oBrukus = GetNearestObjectByTag("HENCH_BRUK");
    object oTarin = GetNearestObjectByTag("HENCH_TARI");

    // EXTRA CODE BELOW
    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetPlotFlag(o) == FALSE)
            FallDown(o);

        o = GetNextObjectInArea();
    }

    AssignCommand(oCP, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE2, 1.0f, 1.5f));
    FallDown(oPC);

    DelayCommand(2.0f, ActionResumeConversation());
}
