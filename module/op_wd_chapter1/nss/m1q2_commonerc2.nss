//Be sure to include a check for a m1q2 Plot Complete global, as well.

int StartingConditional()
{
    int iSeeStairs = GetLocalInt(OBJECT_SELF, "SeeStairs");
    int iTalkedTo = GetLocalInt(OBJECT_SELF, "TalkedTo");

    if(iSeeStairs == FALSE)
    {
        if (iTalkedTo == FALSE)
        {
            return TRUE;
        }
    }
    return FALSE;
}
