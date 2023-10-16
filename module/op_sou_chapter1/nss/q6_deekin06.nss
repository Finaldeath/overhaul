// if Deekin chased the PC initially

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q6_Deekin_Chases_PC") == 1;
    return iResult;
}
