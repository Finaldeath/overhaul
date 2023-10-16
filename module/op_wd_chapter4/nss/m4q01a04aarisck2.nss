//// Checks if Nasher already spoken to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01TALKNASHER") ==1;
    return iResult;
}

