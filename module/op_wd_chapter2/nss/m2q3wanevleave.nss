void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_Leave") == 10)
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(301));
    }
}
