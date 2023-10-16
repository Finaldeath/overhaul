// checks to see if the PC is valid for teleport

// if Ayala has told the PC how she can help him

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1a_Ayala_Help") == 1;
    return iResult;
}
