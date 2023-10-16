int StartingConditional()
{
    int l_iResult;
    int nRandom = Random(16);
    SetLocalInt(OBJECT_SELF,"L_RandomPhrase",nRandom);
    l_iResult = nRandom == 0;
    return l_iResult;
}
