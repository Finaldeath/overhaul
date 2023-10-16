//////Check if PC heard whole story

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_NaxTalk") ==2;
    return iResult;
}

