void main()
{
    object oPC = GetPCSpeaker();
    int nSpell = SPELL_DISPLACEMENT;
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);
    AssignCommand(oPC, ActionCastFakeSpellAtObject(nSpell, OBJECT_SELF));
    DecrementRemainingSpellUses(oPC, nSpell);
    object oHide = GetItemPossessedBy(OBJECT_SELF, "q4_GolemArmor");
    int nCurrentSlot = GetLocalInt(OBJECT_SELF, "CURRENT_SLOT");
    SetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT" + IntToString(nCurrentSlot), nSpell);
    SetLocalInt(GetModule(), "X2_GOLEM_SPELL_SLOT_TARGET_TYPE" + IntToString(nCurrentSlot), 1);
}
