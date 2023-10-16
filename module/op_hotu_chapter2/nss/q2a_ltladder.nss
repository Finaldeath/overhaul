//Attackers climb up to the top of the ladder
#include "nw_i0_generic"
void main()
{
    object oTunnel = GetObjectByTag("q2a_bat1_hole2");
    if (GetIsObjectValid(oTunnel) == FALSE)
        return;

    object oAttacker = GetEnteringObject();
    if (GetIsPC(oAttacker) == FALSE)
    {
        object oGate = GetObjectByTag("q2ainnergate");
        object oJumpTo = GetWaypointByTag("wp_q2a_lotower_ladder");
        SetLocalObject(oAttacker, "oTarget", oGate);
        AssignCommand(oAttacker, JumpToObject(oJumpTo));
        //AssignCommand(oAttacker, DetermineCombatRound());
        DelayCommand(1.0, ActionMoveToObject(oGate));
        DelayCommand(2.0, AssignCommand(oAttacker, DetermineCombatRound()));
        DelayCommand(6.0, SignalEvent(oAttacker, EventUserDefined(5000)));
        //SendMessageToPC(GetFirstPC(), "Tunnel USED");

    }
}
