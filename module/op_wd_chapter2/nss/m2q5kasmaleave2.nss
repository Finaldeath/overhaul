void main()
{
    ActionMoveAwayFromObject(GetPCSpeaker());
    DelayCommand(3.0,ActionJumpToObject(GetWaypointByTag("WP_KASMA_MOVE_DUN2")));
}
