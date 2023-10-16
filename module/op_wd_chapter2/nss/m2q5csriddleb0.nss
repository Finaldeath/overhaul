int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5RiddleA") == 10 &&
                GetLocalInt(GetPCSpeaker(),"NW_L_M2Q5RiddleB") == 0;
    return l_iResult;
}
