// Tymofarrar knows that the PC wishes Deekin freed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Deekin_Talk") == 2;
    return iResult;
}
