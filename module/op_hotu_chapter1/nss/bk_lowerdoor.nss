//* open the lower door when trigger stepped on

void main()
{
    object oWell = GetNearestObjectByTag("welldoor2");
    if (GetIsObjectValid(oWell) == TRUE)
    {
        // * open it
        {
            DelayCommand(3.0, AssignCommand(oWell, ActionOpenDoor(oWell)));
        }
    }
}
