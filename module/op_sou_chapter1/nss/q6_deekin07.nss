// if the PC hasn't already asked Deekin this

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q6_Deekin_Asked_Goal") == 0;
    return iResult;
}
