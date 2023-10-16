// the PC is a halfling

int StartingConditional()
{
    int iResult;

    iResult = GetRacialType(GetPCSpeaker()) == RACIAL_TYPE_HALFLING;
    return iResult;
}
