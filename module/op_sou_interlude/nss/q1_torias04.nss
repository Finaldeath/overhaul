// Once Torias has already seen Zidan

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1_Torias_Saw_Zidan") == 1;
    return iResult;
}
