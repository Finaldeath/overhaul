int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF,"M3Q04CKLAUTHPLOT") == GetPCSpeaker();
    return iResult;
}
