void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    effect e = GetFirstEffect(OBJECT_SELF);
    while(GetIsEffectValid(e))
    {
        RemoveEffect(OBJECT_SELF, e);
        e = GetNextEffect(OBJECT_SELF);
    }

    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
}
