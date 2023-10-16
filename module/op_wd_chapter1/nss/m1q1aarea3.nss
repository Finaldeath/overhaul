void main()
{

    int nCounter =GetLocalInt(OBJECT_SELF,"M1Q1ACounter");
    if(nCounter >= 5)
    {
        SetLocalInt(OBJECT_SELF,"M1Q1ACounter",0);
        SignalEvent(OBJECT_SELF,EventUserDefined(114));
    }
    else
    {
        SetLocalInt(OBJECT_SELF,"M1Q1ACounter",nCounter + 1);
    }


/*    object oArea = OBJECT_SELF;
    int bLightsOn = GetLocalInt(OBJECT_SELF,"NW_L_LightState");
    if( bLampOn && GetDay() )
    {
        DelayCommand(2.0,RecomputeStaticLighting(oArea));
        SetLocalInt(OBJECT_SELF,"NW_L_LightState",FALSE);
    }
    else if( !bLampOn && !GetDay() )
    {
        DelayCommand(2.0,RecomputeStaticLighting(oArea));
        SetLocalInt(OBJECT_SELF,"NW_L_LightState",TRUE);
    }*/

}
