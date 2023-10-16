int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTGLOBEONPEDESTAL")  == 99;
    return iResult;
}
