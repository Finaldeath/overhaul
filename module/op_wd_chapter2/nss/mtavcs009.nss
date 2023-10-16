int StartingConditional()
{
	int l_iResult;

	l_iResult = (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"VA_ARENABADGE001")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"VA_ARENABADGE002")) ||
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"VA_ARENABADGE003"))) &&
                !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"VA_ARENABADGE004")) &&
                GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"VA_MEMBERRING"));
	return l_iResult;
}
