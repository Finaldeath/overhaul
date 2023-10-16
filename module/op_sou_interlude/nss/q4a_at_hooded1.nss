// change hooded figure into Heurodis

void main()
{
    SetLocalObject(OBJECT_SELF, "ACTIVE_PC1", GetPCSpeaker());
    SignalEvent(OBJECT_SELF, EventUserDefined(101));
}
