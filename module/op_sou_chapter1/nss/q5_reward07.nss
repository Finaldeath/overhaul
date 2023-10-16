// the player was promised Deekin's release

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Promised_Reward") == 2;
    return iResult;
}
