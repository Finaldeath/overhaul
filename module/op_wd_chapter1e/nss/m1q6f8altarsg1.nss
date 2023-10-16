void main()
{
    object oDemon = GetLocalObject(GetModule(),"NW_G_M1Q6Demon");
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_GATE);
    SetLocalInt(GetModule(),"NW_G_M1Q6F08Demon_Free",TRUE);
    AssignCommand(oDemon,SurrenderToEnemies());
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1Q6F8Rituals"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,GetLocation(oDemon));

}
