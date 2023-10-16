// the player has not tried to persuade Jasmeena previously

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5a_Tried_Persuade") == 0;
    return iResult;
}
