//act_q2dfrmqueen_1
// Return true if any hostiles are in sight
int StartingConditional()
{
    object oDrow = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
    if (GetObjectSeen(oDrow) == TRUE || GetObjectHeard(oDrow) == TRUE)
        return TRUE;
    return FALSE;
}
