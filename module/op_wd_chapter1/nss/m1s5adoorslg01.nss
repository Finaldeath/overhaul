void main()
{
    SetLocked(OBJECT_SELF,FALSE);
    ActionOpenDoor(OBJECT_SELF);
    AdjustReputation(GetPCSpeaker(),GetObjectByTag("M1S5ADoorGuard"),-100);
}
