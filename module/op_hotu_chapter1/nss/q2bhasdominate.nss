// if the PC has Dominate Person memorized

int StartingConditional()
{
    int iResult;

    iResult = GetHasSpell(SPELL_DOMINATE_PERSON, GetPCSpeaker());
    return iResult;
}
