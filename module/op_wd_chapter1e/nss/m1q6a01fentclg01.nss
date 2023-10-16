// returns true if no player has spoken to Fenthick
int StartingConditional()
{
    return GetLocalInt(GetModule(),"NW_G_M1Q6A01FenthickPreRitual") == FALSE;
}
