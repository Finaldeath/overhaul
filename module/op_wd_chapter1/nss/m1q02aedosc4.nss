int StartingConditional()
{
	int l_iResult;

	l_iResult =( (GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST,GetPCSpeaker())) != "M1Q04IUniform")
                &&  (GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA) < 11) );
	return l_iResult;
}
