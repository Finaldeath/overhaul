int StartingConditional()
{

	return GetGoodEvilValue(GetPCSpeaker()) != ALIGNMENT_EVIL ||
            GetLawChaosValue(GetPCSpeaker()) != ALIGNMENT_CHAOTIC ;
}
