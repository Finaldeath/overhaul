int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF, "M3Q04CKLAUTHSLAY") == GetPCSpeaker();
    return iResult;
}
