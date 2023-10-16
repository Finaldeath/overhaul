void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_M3Q2F_BALOR")==0)
    {
        object oWay = GetObjectByTag("WP_M3Q2F_BALOR");
        location lWay = GetLocation(oWay);
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lWay);
        CreateObject(OBJECT_TYPE_CREATURE,"M3Q2F_BALOR",lWay);
        object oBalor = GetObjectByTag("M3Q2F_BALOR");
        DelayCommand(1.0,AssignCommand(oBalor,ActionSpeakStringByStrRef(66242)));
        SetLocalInt(OBJECT_SELF,"NW_G_M3Q2F_BALOR",1);
    }
}
