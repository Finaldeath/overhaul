// The PC has reached level 2 or higher
// Mischa only says this once

int StartingConditional()
{
    int nLevel = GetHitDice(GetPCSpeaker());
    int nPlot = GetLocalInt(OBJECT_SELF, "q1a_Mischa_Speak1");
    int nLike = GetLocalInt(GetPCSpeaker(), "q1a_Mischa_Reaction");
    if ((nLevel > 1) && (nPlot == 0) && (!nLike < 0))
    {
        SetLocalInt(OBJECT_SELF, "q1a_Mischa_Speak1", 1);
        return TRUE;
    }
    return FALSE;
}
