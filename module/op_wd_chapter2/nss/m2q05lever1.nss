void main()
{
    object oDoor1 = GetObjectByTag("M2Q05DPORT01");
    object oDoor2 = GetObjectByTag("M2Q05DPORT02");

    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    AssignCommand(oDoor1,ActionOpenDoor(OBJECT_SELF));
    AssignCommand(oDoor2,ActionOpenDoor(OBJECT_SELF));
    SignalEvent(GetObjectByTag("M2Q05CBEAST01"),EventUserDefined(500));
    SignalEvent(GetObjectByTag("M2Q05CBEAST02"),EventUserDefined(500));
}
