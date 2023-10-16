void main()
{
    object oTorturer = GetObjectByTag("M2Q05CBBEARTOR");
    object oVictim = GetObjectByTag("M2Q05CBUGBEARVIC");

    if (GetLocalInt(OBJECT_SELF,"NW_L_Torture") == 0 && GetIsPC(GetEnteringObject()))
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Torture",10);
        SignalEvent(oTorturer,EventUserDefined(500));
        DelayCommand(0.5,SignalEvent(oVictim,EventUserDefined(500)));
    }
}
