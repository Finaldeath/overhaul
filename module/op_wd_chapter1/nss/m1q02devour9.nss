void main()
{
/* object oKurdan = GetObjectByTag("M1Q02Ckurdan");
if((GetLocalInt(GetModule(),"M1Q02KurdanTransformed") == 0) && (GetArea(OBJECT_SELF) == GetArea(oKurdan)))
    {
    ActionAttack(oKurdan);
    } */
    object oFormerGuard = GetNearestObjectByTag("M1Q2_INTFORGUAR");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if(GetIsDead(oFormerGuard) != TRUE)
        {
        ClearAllActions();
        SignalEvent(OBJECT_SELF,EventUserDefined(1));
        ActionAttack(oFormerGuard);
        }
    else
        {
        ActionAttack(oPC);
        }
}
