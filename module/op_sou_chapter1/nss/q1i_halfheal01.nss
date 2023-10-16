// some of the halfling wounded have been healed
// Katriana has not been spoken to since that happened

int StartingConditional()
{
    int nHeal = GetLocalInt(GetModule(), "X1_Q1BHalflingsHealed");
    int nSpeak = GetLocalInt(OBJECT_SELF, "q1i_Katriana_Heal01");

    if ((nHeal > 0) && (nSpeak == 0))
    {
        return TRUE;
    }
    return FALSE;
}
