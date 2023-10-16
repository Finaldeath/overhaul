///Makes the gate guard open the gates

void main()
{
    object oDoor = GetObjectByTag("q2acitygate");
    SetLocked(oDoor,FALSE);
    DelayCommand(1.0,AssignCommand(oDoor,ActionOpenDoor(oDoor)));

}
