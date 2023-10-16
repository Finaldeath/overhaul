//////Checks if catapults and golems beaten

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS") >= 2 &&
              GetLocalInt(GetModule(), "NW_G_M4Q01_GOLEMS") >= 2;

    return iResult;
}

