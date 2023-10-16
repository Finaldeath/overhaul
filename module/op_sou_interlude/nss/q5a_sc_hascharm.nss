// player has a charm spell

int StartingConditional()
{
    if(GetHasSpell(SPELL_CHARM_PERSON, GetPCSpeaker()))
    {
        SetLocalInt(GetPCSpeaker(), "Q5_CHARM_SPELL", SPELL_CHARM_PERSON);
        return TRUE;
    }
    else if(GetHasSpell(SPELL_CHARM_MONSTER, GetPCSpeaker()))
    {
        SetLocalInt(GetPCSpeaker(), "Q5_CHARM_SPELL", SPELL_CHARM_MONSTER);
        return TRUE;
    }
    else if(GetHasSpell(SPELL_CHARM_PERSON_OR_ANIMAL, GetPCSpeaker()))
    {
        SetLocalInt(GetPCSpeaker(), "Q5_CHARM_SPELL", SPELL_CHARM_PERSON_OR_ANIMAL);
        return TRUE;
    }
    else if(GetHasSpell(SPELL_MASS_CHARM, GetPCSpeaker()))
    {
        SetLocalInt(GetPCSpeaker(), "Q5_CHARM_SPELL", SPELL_MASS_CHARM);
        return TRUE;
    }
    return FALSE;
}
