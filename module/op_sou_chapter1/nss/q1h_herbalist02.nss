// the PC has not spoken to Farghan already
// Farghan does not know that Drogan is poisoned

int StartingConditional()
{
    int nSpeak = GetLocalInt(GetPCSpeaker(), "PC_Speak_Herbalist");
    int nTold = GetLocalInt(OBJECT_SELF, "q1h_Herbalist_Told_Drogan");
    if ((nSpeak == 0) && (nTold == 0))
    {
        return TRUE;
    }
    return FALSE;
}
