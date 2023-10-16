// Once the initial introduction has been performed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "Seer_Progression") == 1;
    return iResult;
}
