//:://////////////////////////////////////////////////
//:: q2a_per_drowswrd
/*
  Default OnPerception event for Drow Swordsmen - battle 1
 */
//:://////////////////////////////////////////////////

#include "q2_inc_battle"
void main()
{
// * if not runnning normal or better Ai then exit for performance reasons
    // * if not runnning normal or better Ai then exit for performance reasons
    if (GetAILevel() == AI_LEVEL_VERY_LOW) return;

    //Only the leader of a formation has perception
    if (GetLocalInt(OBJECT_SELF, "nLeader") != 1)
        return;
    object oGate = GetObjectByTag("q2acitygate");
    if (GetIsObjectValid(oGate) == TRUE)
        return;


    object oPercep = GetLastPerceived();
    int bSeen = GetLastPerceptionSeen();



    if (GetIsInCombat(OBJECT_SELF))
    {
        return;

    }
    else if (GetIsEnemy(oPercep) && bSeen)
    { // SpawnScriptDebugger();
        SignalEvent(OBJECT_SELF, EventUserDefined(LEADER_ORDER_CHECK_FOR_ENEMIES));
    }

}




