void main()
{
    int nSpell;
    switch(d8())
    {
        case 1: nSpell = SPELL_DAZE;
        break;
        case 2: nSpell = SPELL_MAGE_ARMOR;
        break;
        case 3: nSpell = SPELL_MAGIC_MISSILE;
        break;
        case 4: nSpell = SPELL_RAY_OF_ENFEEBLEMENT;
        break;
        case 5: nSpell = SPELL_SCARE;
        break;
        case 6: nSpell = SPELL_PROTECTION_FROM_EVIL;
        break;
        case 7: nSpell = SPELL_NEGATIVE_ENERGY_RAY;
        break;
        case 8: nSpell = SPELL_RAY_OF_FROST;
        break;

    }
    if(GetUserDefinedEventNumber() == 10)
    {
        if(IsInConversation(OBJECT_SELF) == FALSE &&
           GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                               PLAYER_CHAR_IS_PC,
                                               OBJECT_SELF,
                                               1,
                                               CREATURE_TYPE_PERCEPTION,
                                               PERCEPTION_SEEN)))
        {
            ActionCastSpellAtObject(nSpell,GetNearestObjectByTag("M1Q0BSpellTarget"),METAMAGIC_ANY,TRUE);
        }
        DelayCommand(18.0,SignalEvent(OBJECT_SELF,EventUserDefined(10)));
    }
}
