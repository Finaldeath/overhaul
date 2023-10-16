//Check to see if the PC has sleep memorized...
int StartingConditional()
{
    if (GetHasSpell(SPELL_SLEEP, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}
