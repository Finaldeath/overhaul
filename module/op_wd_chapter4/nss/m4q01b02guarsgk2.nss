////// Check if catapults still active


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS") < 2;
    return iResult;
}
