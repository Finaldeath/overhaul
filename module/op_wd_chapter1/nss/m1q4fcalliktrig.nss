void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        object oCallik = GetNearestObjectByTag("m1Q04CCallik");
        AdjustReputation(GetEnteringObject(),oCallik,-100);
        SignalEvent(oCallik,EventUserDefined(490));
    }
}
