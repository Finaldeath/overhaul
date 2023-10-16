#include "NW_I0_GENERIC"

void main()
{
    SetLocalLocation(GetModule(),"NW_G_ElminsterPC",GetLocation(GetPCSpeaker()));
    SignalEvent(GetObjectByTag("M2Q05CELMINSTER"),EventUserDefined(500));
    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
    DetermineCombatRound();
}
