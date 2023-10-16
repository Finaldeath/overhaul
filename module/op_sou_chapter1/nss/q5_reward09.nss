// the player was promised the mask

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Promised_Reward") == 4;
    return iResult;
}
