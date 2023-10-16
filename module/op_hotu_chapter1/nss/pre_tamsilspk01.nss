// when the PC hero is sent up to speak to Tamsil
// this is the starting condition for that dialogue

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "Tamsil_Speak") == 1;
    return iResult;
}
