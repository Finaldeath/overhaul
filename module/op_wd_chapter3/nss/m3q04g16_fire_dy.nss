// * Create Fire Elemental when it is destroyed
void MakeMonster(location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, "NW_FIREHUGE", lLoc);
}
void main()
{
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, GetLocation(OBJECT_SELF));
    location lLoc = GetLocation(OBJECT_SELF);
    DelayCommand(1.0, MakeMonster(lLoc));
}
