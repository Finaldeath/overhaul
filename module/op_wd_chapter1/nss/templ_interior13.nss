void main()
{
    int nUser = GetLocalInt(OBJECT_SELF,"IN_MY_HOUSE");
    if ((nUser == 1) && (GetIsPC(GetLastPerceived())))
    {
        if (GetLocalInt(OBJECT_SELF,"I_AM_FRIENDLY") == 0)
        {
            SetLocalInt(OBJECT_SELF,"IN_MY_HOUSE",0);
            ActionMoveAwayFromObject(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC),TRUE);
            DelayCommand(10.0,ActionStartConversation(OBJECT_SELF));
        }
    }
}
