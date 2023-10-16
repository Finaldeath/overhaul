// if speaking to Katriana after the first time

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"X1_Q5KATSPEAK") == 10;
    return iResult;
}
