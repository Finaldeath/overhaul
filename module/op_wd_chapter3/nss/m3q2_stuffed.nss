void main()
{
     if(GetLocalInt(OBJECT_SELF,"NW_G_BLINDDEAF")==0)
     {
         SetLocalInt(OBJECT_SELF,"NW_G_BLINDDEAF",1);
         effect eParalyze= EffectParalyze();
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eParalyze, OBJECT_SELF);
         effect eBlindness= EffectBlindness();
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBlindness, OBJECT_SELF);
         effect eDeaf= EffectDeaf();
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDeaf, OBJECT_SELF);
         effect eDam = EffectDamage(45);
         ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDam, OBJECT_SELF);
     }
}
