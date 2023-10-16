// Create a faithful golem servant.

void main()
{
    object oVial = GetLocalObject(OBJECT_SELF, "BLOOD");
    DestroyObject(oVial);
    SetLocalObject(GetArea(OBJECT_SELF), "BONES", OBJECT_SELF);
    SetLocalObject(GetArea(OBJECT_SELF), "GOLEM_MASTER", GetPCSpeaker());
    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
}
