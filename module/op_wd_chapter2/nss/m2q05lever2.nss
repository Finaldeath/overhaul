void main()
{
    object oDoor1 = GetObjectByTag("M2Q05DPORT03");
    object oDoor2 = GetObjectByTag("M2Q05DPORT04");

    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    AssignCommand(oDoor1,ActionOpenDoor(OBJECT_SELF));
    AssignCommand(oDoor2,ActionOpenDoor(OBJECT_SELF));
    SignalEvent(GetObjectByTag("M2Q05CBEAST03"),EventUserDefined(500));
    SignalEvent(GetObjectByTag("M2Q05CBEAST04"),EventUserDefined(500));
}
