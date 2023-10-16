int StartingConditional()
{
    int l_iResult;

        l_iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 3 && GetLocalInt(GetModule(), "NW_G_M3Q02TALKFORTILKARDSIEGE") == 1;
    return l_iResult;
}

