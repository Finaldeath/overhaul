void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_ReagentGiven"))
    {
        ActionForceMoveToObject(GetNearestObjectByTag("WP_M1Q3CTree"));
        ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_UNSUMMON),OBJECT_SELF));
        ActionDoCommand(DestroyObject(OBJECT_SELF,0.5));
        SetCommandable(FALSE);
    }
}
