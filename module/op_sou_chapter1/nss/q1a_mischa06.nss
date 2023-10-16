// The PC has reached level 4 or higher
// Mischa only says this once

int StartingConditional()
{
    int nLevel = GetHitDice(GetPCSpeaker());
    int nPlot = GetLocalInt(OBJECT_SELF, "q1a_Mischa_Speak2");
    int nLike = GetLocalInt(GetPCSpeaker(), "q1a_Mischa_Reaction");
    if ((nLevel > 3) && (nPlot == 0) && (!nLike < 0))
    {
        SetLocalInt(OBJECT_SELF, "q1a_Mischa_Speak2", 1);
        return TRUE;
    }
    return FALSE;
}
