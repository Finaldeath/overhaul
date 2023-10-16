void main()
{
/*    if( (GetDistanceToObject(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)) < 5.0)
        && (GetLocalInt(GetModule(),"M2Q1FarmerHaljalAmbient") == 0)  )
    {
    SpeakString("Player Close");
    SetLocalInt(GetModule(),"M2Q1FarmerHaljalAmbient",1);
    }       */
    if(    (GetDistanceToObject(GetObjectByTag("M2Q1CFARMER")) < 5.0)
        && (GetDistanceToObject(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC)) < 10.0)
        && (GetLocalInt(GetModule(),"M2Q1FarmerHaljalAmbient") == 0)  )
    {
        ClearAllActions();
        AssignCommand(GetObjectByTag("M2Q1CFARMER"),ClearAllActions());
        SpeakString("Signal Farmer");
        SignalEvent(GetObjectByTag("M2Q1CFARMER"),EventUserDefined(200));
    }
}
