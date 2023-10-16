void main()
{
    object oDoor = GetNearestObjectByTag("M2Q05DLUSKGATE");

    SetLocalInt(OBJECT_SELF,"M2Q5F_Warned",0);
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_GateOpen",10);
    ActionUnlockObject(oDoor);
    ActionOpenDoor(oDoor);
}
