// * Destroy this generator and the golem is not susceptible to fire damage

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 0)
    {
          effect eImmuneFire = EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE,100);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT,eImmuneFire,GetObjectByTag("M3Q3_IRONGOLEM17"));

      SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
    }

}
