#include "NW_I0_GENERIC"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 200:
            ClearAllActions();
            DetermineCombatRound();
        break;
    }
}
