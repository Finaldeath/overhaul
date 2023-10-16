void main()
{
    object oPortal = GetNearestObjectByTag("ShadowPortal");
    SignalEvent(oPortal, EventUserDefined(5006));
}
