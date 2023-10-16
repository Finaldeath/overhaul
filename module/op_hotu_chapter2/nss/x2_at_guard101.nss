void main()
{
    object oPC = GetPCSpeaker();
    int nSpell = SPELL_MAGIC_MISSILE;
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);
    AssignCommand(oPC, ActionCastFakeSpellAtObject(nSpell, OBJECT_SELF));
    DecrementRemainingSpellUses(oPC, nSpell);
    object oHide = GetItemPossessedBy(OBJECT_SELF, "q4_GolemArmor");
    int nCurrentSlot = GetLocalInt(OBJECT_SELF, "CURRENT_SLOT");
    SetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT" + IntToString(nCurrentSlot), nSpell);
    SetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT_TARGET_TYPE" + IntToString(nCurrentSlot), 0);
    itemproperty ipSpell = ItemPropertyCastSpell(IP_CONST_CASTSPELL_MAGIC_MISSILE_9, IP_CONST_CASTSPELL_NUMUSES_SINGLE_USE);
}
