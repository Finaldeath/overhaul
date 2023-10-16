void main()
{
    object oWP = GetNearestObjectByTag("MP_VARH_QUAR");

    AssignCommand(OBJECT_SELF, ClearAllActions());

    AssignCommand(OBJECT_SELF, ActionMoveToObject(oWP));

    DelayCommand(4.0, AssignCommand(OBJECT_SELF, JumpToObject(oWP)));

    object oDoor = GetNearestObjectByTag("DOOR_CHANCELLOR");

    SetLocked(oDoor, FALSE);
}
