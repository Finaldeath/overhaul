// if the player has not been told about the ability to change into another weapon

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "IW_WPNCHG") == 0;
    return iResult;
}
