// Check that the the NPC students have talked to the PC before
int StartingConditional()
{
    object oModule = GetModule();
    int iResult = FALSE;
    int iSpoken = GetLocalInt(oModule, "ALTER_SPOKEN_BEFORE");

    if (iSpoken != TRUE)
    {
        iResult = TRUE;
    }

    return iResult;
}
