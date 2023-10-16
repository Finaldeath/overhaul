void main()
{
    SetPlotFlag(OBJECT_SELF, FALSE);

    AssignCommand(OBJECT_SELF, SetIsDestroyable(FALSE, FALSE, FALSE));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);

}
