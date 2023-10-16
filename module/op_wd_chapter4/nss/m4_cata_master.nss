// * is my master still a valid object
int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetLocalObject(OBJECT_SELF,"M4_MASTER"));
    return iResult;
}
