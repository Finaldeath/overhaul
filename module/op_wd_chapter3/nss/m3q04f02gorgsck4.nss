///////Check if already talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Gorgotha_Talk") ==1;
    return iResult;
}

