//Make the sewer workers look busy.

void main()
{
    object oWorker = GetNearestObjectByTag("CT_COMM_NT_SWWR");
    object oTarget = OBJECT_SELF;
    AssignCommand(oWorker, DoPlaceableObjectAction(oTarget, PLACEABLE_ACTION_BASH));
    DelayCommand(3.0, AssignCommand(oWorker, ClearAllActions(TRUE)));
}
