////////Check if Maugrim is alive

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetObjectByTag("M4Q01B26MAUG"));
    return iResult;
}
