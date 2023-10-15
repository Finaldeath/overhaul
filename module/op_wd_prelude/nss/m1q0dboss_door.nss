void main()
{
    if(GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q5DBossSpawned") == FALSE)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q5DBossSpawned",TRUE);
        object oBoss = CreateObject(OBJECT_TYPE_CREATURE,
                                    "M1Q0DBoss",
                                    GetLocation(GetNearestObjectByTag("WP_M1Q0DBoss")));
        DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),oBoss));
        DelayCommand(1.0,AssignCommand(oBoss,SetFacingPoint(GetPosition(OBJECT_SELF))));
        DelayCommand(1.0,AssignCommand(oBoss,SpeakOneLinerConversation()));
    }
}
