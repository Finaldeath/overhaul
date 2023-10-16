void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_TakePC") == 0)
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(500));
    }
    else
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(501));
    }
}
