//Check to see if the PC has charm person memorized...
int StartingConditional()
{
    if (GetHasSpell(SPELL_CHARM_PERSON, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}
