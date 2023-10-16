void main()
{
    SignalEvent(GetNearestObjectByTag("M1Q04CAgnes"),EventUserDefined(400));
    SignalEvent(GetNearestObjectByTag("M1Q04CMorden"),EventUserDefined(400));
    SignalEvent(OBJECT_SELF,EventUserDefined(400));
}
