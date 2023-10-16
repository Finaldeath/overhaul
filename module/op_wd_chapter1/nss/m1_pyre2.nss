void main()
{
    object oPC = GetLastDamager();
    if(GetDamageDealtByType(DAMAGE_TYPE_FIRE) > 0 &&
       GetIsPC(oPC))
    {
        int nReward = 25;
        object oArea = GetArea(OBJECT_SELF);
        SetLocalInt(OBJECT_SELF,"NW_L_OnFire",TRUE);
        SetLocalObject(oArea,"NW_G_PyreToFlame",OBJECT_SELF);
        SignalEvent(oArea,EventUserDefined(10));
        GiveXPToCreature(oPC,nReward);
    }
}
