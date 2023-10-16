// Check the PC size for the appropriate message.
int StartingConditional()
{
    int iResult;

    object oPC = GetPCSpeaker();

    if(GetCreatureSize(oPC) == CREATURE_SIZE_TINY ||
       GetCreatureSize(oPC) == CREATURE_SIZE_SMALL)
    {
        iResult = TRUE;
    }
    else
    {
        iResult = FALSE;
    }
    return iResult;
}
