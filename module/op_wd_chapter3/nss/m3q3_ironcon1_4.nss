// * Makes the Golem immune to blunt weapons.
void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 0)
    {
     // * Make the Blunt Generator give him the Blunt Immunity
     effect eImmuneBlunt = EffectDamageImmunityIncrease(DAMAGE_TYPE_BLUDGEONING,100);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT,eImmuneBlunt,GetObjectByTag("M3Q3_IRONGOLEM17"));
     SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
    }
}
