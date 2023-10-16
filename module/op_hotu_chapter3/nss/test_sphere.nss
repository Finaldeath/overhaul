void main()
{
    object oCast = GetObjectByTag("hx_puzzle_sphere");
    SignalEvent(oCast, EventUserDefined(4444));
}
