// Drogan has not already mentioned that he intends to use the mythallar as a weapon

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Use_Mythallar") == 0;
    return iResult;
}
