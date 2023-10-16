// * Generates the golem's electrical resistance
void main()
{

    if (GetLocalInt(OBJECT_SELF,"NW_L_DOONCE") == 0)
    {
    effect eImmuneElectric = EffectDamageImmunityIncrease(DAMAGE_TYPE_ELECTRICAL,100);
     ApplyEffectToObject(DURATION_TYPE_PERMANENT,eImmuneElectric,GetObjectByTag("M3Q3_IRONGOLEM17"));
      SetLocalInt(OBJECT_SELF,"NW_L_DOONCE",1);
    }
}
