//  * morag spawns her personal guards
void main()
{
    // *
    if(GetLocalInt(OBJECT_SELF,"NW_G_M3Q2I_GUARDS")==0)
    {
        object oGuard = CreateObject(OBJECT_TYPE_CREATURE, "M3Q2GLizCry", GetLocation(OBJECT_SELF));
        effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
        ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, GetLocation(oGuard));

        oGuard = CreateObject(OBJECT_TYPE_CREATURE, "M3Q2GLizCry", GetLocation(OBJECT_SELF));
        eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
        ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, GetLocation(oGuard));

        oGuard = CreateObject(OBJECT_TYPE_CREATURE, "M3Q2G12LizWiz", GetLocation(OBJECT_SELF));
        eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
        ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, GetLocation(oGuard));

        eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        DelayCommand(2.7, ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, GetLocation(OBJECT_SELF))));
        DestroyObject(OBJECT_SELF, 3.0);
        SetLocalInt(OBJECT_SELF,"NW_G_M3Q2I_GUARDS",1);
    }
}
