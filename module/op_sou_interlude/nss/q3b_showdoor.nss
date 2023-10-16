// reveal shpinx door

void main()
{
    object oDoor = GetNearestObjectByTag("Q3D_HIDDEN_TRIG2a");
    SignalEvent(oDoor, EventUserDefined(101));
}
