// the Seer's regular dialogue during Chapter 2

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "Seer_Progression") == 4;
    return iResult;
}
