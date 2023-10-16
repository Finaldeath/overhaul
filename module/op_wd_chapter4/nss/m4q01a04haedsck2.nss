///// Check if Haedraline talked to 1

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M4Q01_HAEDRALINE_TALKEDTO") ==1;

    return iResult;
}




