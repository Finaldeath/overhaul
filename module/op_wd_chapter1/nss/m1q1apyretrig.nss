void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(114));
        DestroyObject(OBJECT_SELF);
    }
}
