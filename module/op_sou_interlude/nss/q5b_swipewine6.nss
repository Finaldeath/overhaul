// if the bottle has already been taken

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5b_Bottle_Gone") == 1;
    return iResult;
}
