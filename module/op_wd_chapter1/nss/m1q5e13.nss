void main()
{
    object oItem = GetObjectByTag("M1Q5E13Focus");
    if( GetIsObjectValid(oItem) &&
        GetIsPC(GetItemPossessor(oItem)) )
    {
        RemoveEffect(GetLocalObject(GetModule(),"M1Q5E13guln"),EffectDamageReduction(5,DAMAGE_POWER_PLUS_ONE));
    }
}
