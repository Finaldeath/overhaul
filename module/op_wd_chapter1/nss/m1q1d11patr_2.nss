#include "NW_I0_Generic"
void main()
{
    object oTarget = GetLastPerceived();
    if(GetIsObjectValid(oTarget) &&
       GetLastPerceptionSeen() &&
       GetIsEnemy(oTarget) )
    {
        ClearAllActions();
        ActionMoveToObject(GetObjectByTag("WP_M1Q1DGong"),TRUE,1.0);
        ActionInteractObject(GetNearestObjectByTag("M1S2EGong"));
        ActionDoCommand(DetermineCombatRound());
    }
}
