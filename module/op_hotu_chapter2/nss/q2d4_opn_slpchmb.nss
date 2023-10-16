//q2d4_opn_slpchmb
//Create an angry Mindflayer

#include "nw_i0_generic"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nSpawnOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nSpawnOnce", 1);
    object oTarget = GetNearestObjectByTag("wp_q2d4_angrymf");
    object oMF = CreateObject(OBJECT_TYPE_CREATURE, "x2_mindfdarkener", GetLocation(oTarget));
    AssignCommand(oMF, DetermineCombatRound());
}
