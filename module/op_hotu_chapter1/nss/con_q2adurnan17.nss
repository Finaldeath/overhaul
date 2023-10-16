int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_WELLROOMOPEN")== 10;
    return iResult;
}
