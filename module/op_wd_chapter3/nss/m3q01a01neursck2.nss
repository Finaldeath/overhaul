/////// First Time Talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NEURIK_TALK") ==0;
    return iResult;
}
