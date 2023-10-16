void main()
{
    SetLocalObject(OBJECT_SELF, "M1Q2AFollowTarget",OBJECT_INVALID);
    ActionForceMoveToObject(GetNearestObject(OBJECT_TYPE_DOOR), TRUE, 1.1);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
