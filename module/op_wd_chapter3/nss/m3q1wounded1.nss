// * if fully healed
int StartingConditional()
{
    int iResult;

    iResult = GetCurrentHitPoints() >= GetMaxHitPoints();
    return iResult;
}
