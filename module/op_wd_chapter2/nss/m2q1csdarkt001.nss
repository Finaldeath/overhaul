int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M2Q1TalkedDarktongue") == 0;
    return iResult;
}
