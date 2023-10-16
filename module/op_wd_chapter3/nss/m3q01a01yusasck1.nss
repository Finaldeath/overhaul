///////Checks if Yusam talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Yusam_Talk") ==1;
    return iResult;
}

