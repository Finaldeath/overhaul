// worker wounded

int StartingConditional()
{
    object oWorker = GetNearestObjectByTag("Q3A_WORKER");
    return (GetCurrentHitPoints(oWorker) == 1);
}
