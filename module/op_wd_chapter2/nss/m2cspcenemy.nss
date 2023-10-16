int StartingConditional()
{
    int iResult;

    iResult = GetIsEnemy(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));
    return iResult;
}
