// if Nyphithys was freed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NYPHITHYS_IS_FREE") == 1;
    return iResult;
}
