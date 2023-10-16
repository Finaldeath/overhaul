//Check to see if the PC has scare memorized...
int StartingConditional()
{
    if (GetHasSpell(SPELL_SCARE, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}
