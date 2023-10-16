int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_EntranceGrantedLerk") == 1;
    return iResult;
}
