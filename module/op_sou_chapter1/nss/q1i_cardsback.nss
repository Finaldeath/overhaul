// someone already returned the cards

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1i_Katriana_Job") == 1;
    return iResult;
}
