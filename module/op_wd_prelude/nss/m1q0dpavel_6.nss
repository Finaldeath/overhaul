void main()
{
    if(GetTag(GetLastAttacker()) == "M1Q0DKillPavel")
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(),OBJECT_SELF);
    }
}
