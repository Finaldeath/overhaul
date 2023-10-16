// the PC is of evil or non-good chaotic alignment
// 33% chance of falling to the next line

int StartingConditional()
{
    int nAlign1 = GetAlignmentGoodEvil(GetPCSpeaker());
    int nAlign2 = GetAlignmentLawChaos(GetPCSpeaker());
    int nRoll = d100();

    if ((nAlign1 == ALIGNMENT_EVIL) && (nRoll > 51))
    {
        return TRUE;
    }
    else if ((!nAlign1 == ALIGNMENT_GOOD) && (nAlign2 == ALIGNMENT_CHAOTIC) && (nRoll > 51))
    {
        return TRUE;
    }
    return FALSE;
}
