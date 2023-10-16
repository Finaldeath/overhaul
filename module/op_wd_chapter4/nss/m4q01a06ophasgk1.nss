//// Checks if Luce and her sister Leesa have been reunited

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE")==1;
    return iResult;
}
