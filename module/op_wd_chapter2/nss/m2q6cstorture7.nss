#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = CheckIntelligenceLow() &&
                (GetHasSpell(SPELL_CURE_LIGHT_WOUNDS,GetPCSpeaker()) ||
                GetHasSpell(SPELL_CURE_MINOR_WOUNDS,GetPCSpeaker()) ||
                GetHasSpell(SPELL_CURE_MODERATE_WOUNDS,GetPCSpeaker()) ||
                GetHasSpell(SPELL_CURE_SERIOUS_WOUNDS,GetPCSpeaker()) ||
                GetHasSpell(SPELL_CURE_CRITICAL_WOUNDS,GetPCSpeaker()));
	return l_iResult;
}
