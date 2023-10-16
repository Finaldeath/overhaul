/////// Plot not done yet, PC not agreed to help

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE") ==0;

    return iResult;
}
