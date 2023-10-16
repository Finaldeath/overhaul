// the pool currently has 2 tokens in it

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q3_Tokens_Thrown") == 2;
    return iResult;
}
