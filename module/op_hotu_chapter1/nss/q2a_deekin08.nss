// once Deekin has been talked to the first time

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q2a_Talk_Deekin") == 1;
    return iResult;
}
