#include "NW_I0_Generic"
void main()
{
    if(GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_G_M1Q2DevTarget")) == FALSE)
    {
        DetermineCombatRound();
    }
}
