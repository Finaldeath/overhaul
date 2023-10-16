// if all of the halfling wounded have been healed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X1_Q1BHalflingsHealed") == 3;
    return iResult;
}
