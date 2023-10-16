int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5EnteredDungeon") == 0;
    return l_iResult;
}
