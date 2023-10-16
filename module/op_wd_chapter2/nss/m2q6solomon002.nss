void main()
{
    SetLocalInt(GetModule(),"NW_G_M2Q6MainPlot",GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") + 1);
    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DEATH_L),GetLocation(OBJECT_SELF));
    DelayCommand(1.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
