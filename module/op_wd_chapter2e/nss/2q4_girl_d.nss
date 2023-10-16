void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1002)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        if(GetIsObjectValid(oPC))
        {
            ActionMoveAwayFromObject(oPC, TRUE);
        }
    }
}
