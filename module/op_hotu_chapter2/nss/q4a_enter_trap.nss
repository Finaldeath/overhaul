void main()
{
    int i = 1;
    object oBallista = GetNearestObjectByTag("q4a_ballista", OBJECT_SELF, i);
    while(oBallista != OBJECT_INVALID)
    {
        SignalEvent(oBallista, EventUserDefined(101));
        i++;
        oBallista = GetNearestObjectByTag("q4a_ballista", OBJECT_SELF, i);
    }
}
