///// Check if Haedraline talked to at 0

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M4Q01_HAEDRALINE_TALKEDTO") ==0;

    return iResult;
}

