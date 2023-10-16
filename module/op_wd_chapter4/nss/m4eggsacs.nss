// * each egg sac when destroyed spits out a creature
void main()
{   // * Don't spawn anything if Morag dead
    if (GetLocalInt(GetModule(),"NW_G_MORAGDEAD") == 0)
    {
        CreateObject(OBJECT_TYPE_CREATURE, GetTag(OBJECT_SELF), GetLocation(OBJECT_SELF));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_FNF_IMPLOSION), OBJECT_SELF);
    }
}
