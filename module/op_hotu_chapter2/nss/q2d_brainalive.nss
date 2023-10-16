///Checks if Elder Brain is still alive

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X2_Q2DKilledOvermind")!=1;
    return iResult;
}
