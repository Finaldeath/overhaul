/////Play when Maugrim dies for the final time

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01PLOTMAUGRIM") ==99;
    return iResult;
}

