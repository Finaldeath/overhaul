// if the correct combination of runes has been pressed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "Rune_Count") == 3;
    return iResult;
}
