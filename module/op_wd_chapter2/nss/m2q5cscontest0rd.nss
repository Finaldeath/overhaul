int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetLastSpeaker(),"NW_L_M2Q5EnteredDungeon") == 0 &&
              Random(2);
    return iResult;
}
