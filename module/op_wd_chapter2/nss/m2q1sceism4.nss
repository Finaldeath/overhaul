int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(),"NW_G_URTHCURED") == 1 &&
                GetLocalInt(GetModule(),"NW_G_URTHISDEAD") == 0;
    return l_iResult;
}

