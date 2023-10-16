void main()
{
    ActionMoveAwayFromObject(GetPCSpeaker(),TRUE);
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
