//q2a_block_drowsum
void main()
{
    object oBlocker = GetBlockingDoor();
    if (GetObjectType(oBlocker) == OBJECT_TYPE_CREATURE)
    {
        // * Increment number of times blocked
        SetLocalInt(OBJECT_SELF, "X2_NUMTIMES_BLOCKED", GetLocalInt(OBJECT_SELF, "X2_NUMTIMES_BLOCKED") + 1);
        if (GetLocalInt(OBJECT_SELF, "X2_NUMTIMES_BLOCKED") > 2)
        {
            SetLocalInt(OBJECT_SELF, "X2_NUMTIMES_BLOCKED",0);
            ClearAllActions(TRUE);
            object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
            if (GetIsObjectValid(oEnemy) == TRUE)
            {
                ActionAttack(oEnemy);
            }
            return;
        }
        return;
    }
}
