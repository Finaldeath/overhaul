#include "NW_I0_GENERIC"

void main()
{
    //Do not bother checking the last target seen if already fighting
    if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            SetFacingPoint(GetPosition(GetLastPerceived()));
            if(GetTag(GetLastPerceived()) == "M1Q0DPavel")
            {
                DetermineCombatRound(GetLastPerceived());
            }
            else if(!GetIsObjectValid(GetNearestObjectByTag("M1Q0DPavel")))
            {
                DetermineCombatRound();
            }
         }
        //If the last perception event was hearing based or if someone vanished then go to search mode
        else if ((GetLastPerceptionHeard() || GetLastPerceptionVanished()) && !GetLastPerceptionSeen())
        {

        }
    }
    if(GetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT) && GetLastPerceptionSeen())
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(1002));
    }
}
