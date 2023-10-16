// The herbs have not been brought for Master Drogan
// Mischa only says this once

int StartingConditional()
{
    int nCure = GetLocalInt(GetModule(), "Drogan_Healed");
    int nPlot = GetLocalInt(OBJECT_SELF, "q1a_Mischa_Speak4");
    if ((nCure == 0) && (nPlot == 0))
    {
        SetLocalInt(OBJECT_SELF, "q1a_Mischa_Speak4", 1);
        return TRUE;
    }
    return FALSE;
}
