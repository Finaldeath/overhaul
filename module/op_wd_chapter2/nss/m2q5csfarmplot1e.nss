int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(), "NW_G_LEAHISDEAD") == 0 &&
                GetLocalInt(GetModule(), "NW_G_LEAH_HOME") == 20 &&
                GetLocalInt(GetModule(), "NW_G_M2Q05PLOTDERG") < 20;

    return l_iResult;
}


