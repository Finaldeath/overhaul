int StartingConditional()
{
    int l_iResult;

    l_iResult =

    GetLocalInt(GetModule(), "NW_G_LEAHISDEAD") == 10
    &&
    GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") == 20
    ;

    return l_iResult;
}
