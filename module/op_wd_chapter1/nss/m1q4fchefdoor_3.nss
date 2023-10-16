void main()
{
    SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q4DChefDoorOpen",TRUE);
    SignalEvent(GetNearestObjectByTag("m1Q04CChef"),EventUserDefined(440));
}
