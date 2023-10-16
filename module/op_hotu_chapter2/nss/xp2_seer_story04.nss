// Once the second part of Seer's dialogue has been started

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "Seer_Progression") == 2;
    return iResult;
}

