// stop compass from working
// replace special ability with find traps ability.

void main()
{
    object oPC = GetLastDisturbed();
    SetLocalInt(GetArea(OBJECT_SELF), "COMPASS_ACTIVE", 0);
    // remove item property
    object oCompass = GetItemPossessedBy(oPC, "q6_compass");
    itemproperty ipFindTraps = ItemPropertyCastSpell(IP_CONST_CASTSPELL_FIND_TRAPS_3, IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY);
    itemproperty ipUnique = GetFirstItemProperty(oCompass);
    while(GetIsItemPropertyValid(ipUnique))
    {
        if(GetItemPropertyType(ipUnique) == ITEM_PROPERTY_CAST_SPELL)
        {
            if(GetItemPropertySubType(ipUnique) == IP_CONST_CASTSPELL_UNIQUE_POWER_SELF_ONLY)
            {
                RemoveItemProperty(oCompass, ipUnique);
                AddItemProperty(DURATION_TYPE_PERMANENT, ipFindTraps, oCompass);
                return;
            }
        }
        ipUnique = GetNextItemProperty(oCompass);
    }

}
