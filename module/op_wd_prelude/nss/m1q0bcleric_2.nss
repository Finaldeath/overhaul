void main()
{
    if(GetIsPC(GetLastPerceived()) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(0));
    }
}
