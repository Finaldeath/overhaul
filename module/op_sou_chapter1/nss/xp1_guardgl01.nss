// the PC is of good or non-evil lawful alignment
// 33% chance of falling to the next line

int StartingConditional()
{
    int nAlign1 = GetAlignmentGoodEvil(GetPCSpeaker());
    int nAlign2 = GetAlignmentLawChaos(GetPCSpeaker());
    int nRoll = d100();

    if ((nAlign1 == ALIGNMENT_GOOD) && (nRoll > 51))
    {
        return TRUE;
    }
    else if ((!nAlign1 == ALIGNMENT_EVIL) && (nAlign2 == ALIGNMENT_LAWFUL) && (nRoll > 51))
    {
        return TRUE;
    }
    return FALSE;
}
