//fourth hack to equip weapons for NPC henchmen.
void main()
{
    object oSelf = OBJECT_SELF;
    object oPerceived = GetLastPerceived();

    // if you see a hostile creature pull your weapon.
    if ((GetObjectType(oPerceived) == OBJECT_TYPE_CREATURE)
        && (GetIsReactionTypeHostile(oSelf, oPerceived) == TRUE))
    {
        ActionEquipMostDamagingMelee(oPerceived);
    }

    ExecuteScript("nw_ch_ac2", oSelf);
}
