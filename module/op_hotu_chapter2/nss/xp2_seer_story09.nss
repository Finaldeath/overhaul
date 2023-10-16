// the Seer's regular dialogue at the beginning
// of Chapter 2 has not been done

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "Seer_Progression") < 4;
    return iResult;
}
