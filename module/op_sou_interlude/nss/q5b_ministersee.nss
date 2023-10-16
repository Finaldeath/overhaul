// the minister exists and can see the PC

int StartingConditional()
{
    object oPriest = GetObjectByTag("Q5B_PRIEST");

    if ((GetIsObjectValid(oPriest)) && (GetObjectSeen(GetPCSpeaker(), oPriest)))
    {
        return TRUE;
    }
    return FALSE;
}
