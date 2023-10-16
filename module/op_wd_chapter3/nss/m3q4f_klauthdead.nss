int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_KLAUTHDEAD")==99;
    return iResult;
}
