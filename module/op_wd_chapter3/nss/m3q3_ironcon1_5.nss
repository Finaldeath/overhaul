// * Makes the Golem immune to slashing weapons.
void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 0)
    {
    object oGolem = GetObjectByTag("M3Q3_IRONGOLEM17");
    effect eImmuneSlash = EffectDamageImmunityIncrease(DAMAGE_TYPE_SLASHING,100);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT,eImmuneSlash,oGolem);
     SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
    }
}
