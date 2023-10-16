// Bring on the golems

#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();
    object oSilver1 = GetNearestObjectByTag("q4c_SilverGolemGuard1");
    object oSilver2 = GetNearestObjectByTag("q4c_SilverGolemGuard2");

    object oWPRight = GetWaypointByTag("q4c_wp_attack_right");
    object oWPLeft = GetWaypointByTag("q4c_wp_attack_left");

    AssignCommand(oSilver1, ActionMoveToObject(oWPRight, TRUE, 1.0));
    AssignCommand(oSilver1, ActionDoCommand(DetermineCombatRound()));
    AssignCommand(oSilver2, ActionMoveToObject(oWPLeft, TRUE, 1.0));
    AssignCommand(oSilver2, ActionDoCommand(DetermineCombatRound()));

    int i = 1;
    object oGolem = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_CONSTRUCT, OBJECT_SELF, i);
    object oWP;
    float fDistance;
    while(oGolem != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(oPC, oGolem);
        if(fDistance > 30.0)
            return;
        oWP = GetLocalObject(oGolem, "RUNTO");
        if(oWP != OBJECT_INVALID)
        {
           AssignCommand(oGolem, ActionMoveToObject(oWP, TRUE, 1.0));
           AssignCommand(oGolem, ActionDoCommand(DetermineCombatRound()));
        }
        i++;
        oGolem = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_CONSTRUCT, OBJECT_SELF, i);
    }
}
