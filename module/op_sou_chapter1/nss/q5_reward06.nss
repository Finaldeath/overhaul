// the player was promised gold and magic

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Promised_Reward") == 1;
    return iResult;
}
