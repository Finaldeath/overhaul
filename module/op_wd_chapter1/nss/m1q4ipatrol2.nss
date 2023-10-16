#include "NW_I0_Generic"
void main()
{
    object oPerceived = GetLastPerceived();
    if (GetLastPerceptionSeen() &&
        !GetIsFriend(oPerceived) )
    {
        ClearAllActions();
        ActionMoveToObject(GetNearestObjectByTag("WP_M1Q4IGong"),TRUE);
        ActionInteractObject(GetNearestObjectByTag("M1Q4IGong"));
        ActionDoCommand(DetermineCombatRound());
    }
}
