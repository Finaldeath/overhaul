// Drogan has received the herbs

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "Drogan_Healed") == 1;
    return iResult;
}
