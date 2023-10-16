int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M4Q01TALK_ARCHEOLOGIST") ==1;
    return iResult;
}
