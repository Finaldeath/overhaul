int StartingConditional()
{
    int l_iResult;

    l_iResult = !GetIsObjectValid(GetPCSpeaker()) &&
                GetLocalInt(OBJECT_SELF,"TalkingToAnder") == 10;
    return l_iResult;
}
