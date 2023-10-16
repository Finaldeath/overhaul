///////Checks if Yusam not yet talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Yusam_Talk") ==0;
    return iResult;
}


