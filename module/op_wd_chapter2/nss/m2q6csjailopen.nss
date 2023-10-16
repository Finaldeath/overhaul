int StartingConditional()
{
    int iResult;

    iResult = !GetLocked(GetObjectByTag("M2Q06DPORTC01")) &&
              !GetLocked(GetObjectByTag("M2Q06DPORTC02"));
    return iResult;
}
