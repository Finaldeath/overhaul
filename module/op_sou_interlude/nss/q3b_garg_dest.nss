void main()
{
    object oTrap = GetNearestObjectByTag("X0_TRAP_MMISS");
    SignalEvent(oTrap, EventUserDefined(101));
    object oGarg = GetNearestObjectByTag("Q3B_STATUE_TRAP");
    if(oGarg == OBJECT_INVALID || GetDistanceBetween(OBJECT_SELF, oGarg) > 40.0)
        DestroyObject(oTrap);
}
