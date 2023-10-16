int StartingConditional()
{
	int bCondition = GetAlignmentGoodEvil(GetPCSpeaker()) != ALIGNMENT_GOOD ||
                     GetAlignmentLawChaos(GetPCSpeaker()) != ALIGNMENT_LAWFUL;
	return bCondition;
}
