void main()
{
    location lDemon = GetLocalLocation(OBJECT_SELF,"NW_L_M1Q6F08Location");
    object oAngel = CreateObject (OBJECT_TYPE_CREATURE,"M1Q6F08GUARDIAN",lDemon);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3),GetLocation(oAngel));
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1Q6Book_Helm"));
    SetLocalInt(GetModule(),"NW_G_M1Q6F08Guardian_Free",TRUE);
}
