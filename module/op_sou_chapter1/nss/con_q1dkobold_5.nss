//Check to see if the PC has bane memorized...
int StartingConditional()
{
    if (GetHasSpell(SPELL_BANE, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}
