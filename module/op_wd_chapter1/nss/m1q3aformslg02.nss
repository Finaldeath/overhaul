#include "NW_I0_GENERIC"


void main()
{
    SetPlotFlag(OBJECT_SELF,FALSE);
    AdjustReputation(GetPCSpeaker(), OBJECT_SELF, -100);
    DetermineCombatRound();

}

