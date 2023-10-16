////// Check if Troops rallied

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M4Q01_RALLY2") ==1;
    return iResult;
}

