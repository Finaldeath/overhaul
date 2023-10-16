// to prevent multiple intimidate attempts

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1d_Hostage_Intimidate") == 0;
    return iResult;
}
