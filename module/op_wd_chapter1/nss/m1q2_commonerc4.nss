int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iTalkedTo = GetLocalInt(OBJECT_SELF, "TalkedTo");
    int iSeeStairs = GetLocalInt(OBJECT_SELF, "SeeStairs");

    if (GetIsObjectValid(oPC))
    {
        if (iTalkedTo == TRUE)
        {
            if (iSeeStairs == FALSE)
            {
                return TRUE;
            }
        }
    }
    return FALSE;
}
