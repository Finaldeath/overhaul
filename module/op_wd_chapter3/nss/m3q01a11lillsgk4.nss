int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(OBJECT_SELF,"NW_G_M3Q01PLOTGLOBEONPEDESTAL") == 1;
    return l_iResult;
}
