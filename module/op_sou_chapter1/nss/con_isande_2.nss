int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "XP1_ISANDESWORD") ==10;
    return iResult;
}
