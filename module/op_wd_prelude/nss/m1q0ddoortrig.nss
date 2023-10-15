void main()
{
    object oPC = GetEnteringObject();
    if( GetIsPC(oPC) && GetHitDice(oPC) > 1)
    {
        object oDoor = GetNearestObjectByTag("M1Q0DLevelUpDoor");
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        SetLocked(oDoor,FALSE);
    }
}
