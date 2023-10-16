void main()
{
    object oEntered = GetEnteringObject();
    object oGuard = GetNearestObjectByTag("NW_PG_GUARD");

    if (GetTag(oEntered) == "NW_PG_COMMANDER")
    {
        AssignCommand(oEntered,ClearAllActions());
        AssignCommand(oEntered,ActionMoveToObject(oGuard));
        AssignCommand(oEntered,ActionWait(1.0));
        AssignCommand(oEntered,ActionDoCommand(PlayAnimation(ANIMATION_FIREFORGET_SALUTE)));
        AssignCommand(oGuard,PlayAnimation(ANIMATION_FIREFORGET_SALUTE));
        DelayCommand(3.0,SignalEvent(oEntered,EventUserDefined(100)));
    }
}
