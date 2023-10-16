int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetObjectByTag("M2Q1CSHAR")) &&
              GetDistanceToObject(GetObjectByTag("M2Q1CSHAR")) < 4.0;
    return iResult;
}
