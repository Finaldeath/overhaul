void main()
{
    object oConst = GetNearestObjectByTag("CT_COMM_GC_CONS");

    AssignCommand(oConst, SetIsDestroyable(FALSE, TRUE, TRUE));
    SetPlotFlag(oConst, FALSE);
    SetCommandable(TRUE, oConst);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oConst);
}
