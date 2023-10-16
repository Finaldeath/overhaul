// animate statue of Jergal

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ANIMATE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ANIMATE_ONCE", 1);

    DestroyObject(OBJECT_SELF);
    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
}
