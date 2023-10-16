void main()
{
    SetLocalInt(GetModule(),"ADMITTED_TO_MELDANEN_ESTATE",1);
    object oDoor = GetNearestObjectByTag("M1Q3AMeldGate");
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
    SetLocked(oDoor,FALSE);
}
