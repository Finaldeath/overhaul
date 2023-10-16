int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") == 30 &&
              GetIsObjectValid(GetPCSpeaker());
    return iResult;
}
