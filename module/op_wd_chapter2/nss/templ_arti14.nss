int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_ARTI_PLOT_TALKEDTO") == 1;
    return iResult;
}
