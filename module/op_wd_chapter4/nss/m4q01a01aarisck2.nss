////Check if Gend love talk not happened yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01GEND_LOVE") ==0;
    return iResult;
}
