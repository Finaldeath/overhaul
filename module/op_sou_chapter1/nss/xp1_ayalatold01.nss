// the main plot has already been explained to the PC

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "Told_Main_Plot") == 1;
    return iResult;
}
