// the PC has already spoken to Tymofarrar
// Tymofarrar already made the offer to the PC,
// but the PC did not agree to it

int StartingConditional()
{
    int nSpeak = GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS");
    int nOffer = GetLocalInt(OBJECT_SELF, "q5_Made_Offer");

    if ((nSpeak == 1) && (nOffer == 1))
    {
        return TRUE;
    }
    return FALSE;
}
