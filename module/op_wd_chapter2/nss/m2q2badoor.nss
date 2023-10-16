void main()
{
    object oBear = GetObjectByTag("M2Q2CBEARTROLL1");
    object oTroll1 = GetObjectByTag("M2Q2BATROLL1");
    object oTroll2 = GetObjectByTag("M2Q2BATROLL2");

    SignalEvent(oBear,EventUserDefined(200));
    SignalEvent(oTroll1,EventUserDefined(200));
    SignalEvent(oTroll2,EventUserDefined(200));
}
