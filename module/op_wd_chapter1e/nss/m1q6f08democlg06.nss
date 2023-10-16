int StartingConditional()
{

	return GetAlignmentGoodEvil(GetPCSpeaker()) == ALIGNMENT_EVIL &&
            GetAlignmentLawChaos(GetPCSpeaker()) == ALIGNMENT_CHAOTIC ;
}
