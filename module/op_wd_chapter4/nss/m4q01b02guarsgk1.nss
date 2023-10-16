 ////// Check if Golems still active


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01_GOLEMS") < 2;
    return iResult;
}
