// 7% chance of line being TRUE
int StartingConditional()
{
    int iChance = d100();
    if (iChance < 8)
    {
        return TRUE;
    }
    return FALSE;
}
