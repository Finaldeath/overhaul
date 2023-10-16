// Once the third part of Seer's dialogue has been started

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "Seer_Progression") == 3;
    return iResult;
}
