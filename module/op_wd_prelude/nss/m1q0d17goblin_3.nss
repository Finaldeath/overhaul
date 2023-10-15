#include "NW_I0_GENERIC"
void main()
{
    object oPavel = GetNearestObjectByTag("M1Q0DPavel");
    if(GetIsObjectValid(oPavel))
    {
       DetermineCombatRound(oPavel);
    }
    else
    {
        DetermineCombatRound();
    }

}


