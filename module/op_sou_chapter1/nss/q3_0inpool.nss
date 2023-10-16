// the pool currently has 0 tokens in it

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q3_Tokens_Thrown") == 0;
    return iResult;
}
