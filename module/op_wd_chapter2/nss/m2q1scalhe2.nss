int StartingConditional()
{
    int l_iResult;

    l_iResult = GetIsObjectValid(GetPCSpeaker()) &&
                GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") < 30;
    return l_iResult;
}
