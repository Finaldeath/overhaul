#include "NW_I0_GENERIC"
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object nTrespasser = GetLocalObject(GetArea(OBJECT_SELF),"NW_A_Trespasser");

    switch (nEvent)
    {
        case 500:
            AdjustReputation(nTrespasser,OBJECT_SELF,-100);
            DetermineCombatRound(nTrespasser);
        break;
    }
}
