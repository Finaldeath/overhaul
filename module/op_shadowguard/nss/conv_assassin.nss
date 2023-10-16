int StartingConditional()
{
    //Xanthar has attempted to assassinate the player.
    int iAssassin = GetLocalInt(GetModule(), "XANTHAR_ATTACKS");

    if (iAssassin != FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
