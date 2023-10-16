/////Play when Maugrim is reborn

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01PLOTMAUGRIM") ==2;
    return iResult;
}
