// returns TRUE if the PC is level 1

int StartingConditional()
{
    int iResult;

    iResult = GetHitDice(GetPCSpeaker()) == 1;
    return iResult;
}
