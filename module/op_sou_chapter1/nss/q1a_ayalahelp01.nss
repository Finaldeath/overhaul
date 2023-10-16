// if Ayala hasn't yet told the PC how she can help him

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1a_Ayala_Help") == 0;
    return iResult;
}
