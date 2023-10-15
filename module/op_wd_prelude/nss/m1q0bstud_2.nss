void main()
{
    if(GetIsPC(GetLastPerceived()))
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(200));
    }
}
