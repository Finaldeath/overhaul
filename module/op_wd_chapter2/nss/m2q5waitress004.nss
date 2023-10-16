int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetObjectByTag("M2Q1CSHAR")) &&
              !GetIsObjectValid(GetObjectByTag("M2Q1CSHAR2")) &&
              !GetIsObjectValid(GetObjectByTag("M2Q1CZOR"));
    return iResult;
}
