// the player was promised Hilltop's safety

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Promised_Reward") == 3;
    return iResult;
}
