// the pool currently has 1 token in it

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q3_Tokens_Thrown") == 1;
    return iResult;
}
