int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
               GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") == 30;
    return iResult;
}

