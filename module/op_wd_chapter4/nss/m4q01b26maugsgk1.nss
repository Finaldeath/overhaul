//////Check if Maugrim is dying

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M4Q01PLOTMAUGRIM") ==1;
    return iResult;
}
