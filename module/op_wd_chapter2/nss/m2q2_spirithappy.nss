int StartingConditional()
{
    int iResult = GetLocalInt(GetModule(),"NW_2Q2_SPIRITFINISHEDGOOD");
    if(iResult == 99)
    {
        return TRUE;
    }
    return FALSE;
}
