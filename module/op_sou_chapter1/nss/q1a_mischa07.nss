// The PC brought the herbs for Master Drogan
// Mischa only says this once

int StartingConditional()
{
    int nCure = GetLocalInt(GetPCSpeaker(), "Drogan_Herbs");
    int nPlot = GetLocalInt(OBJECT_SELF, "q1a_Mischa_Speak3");
    if ((nCure == 2) && (nPlot == 0))
    {
        SetLocalInt(OBJECT_SELF, "q1a_Mischa_Speak3", 1);
        return TRUE;
    }
    return FALSE;
}

