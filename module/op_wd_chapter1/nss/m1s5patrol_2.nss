#include "NW_I0_GENERIC"

void main()
{
    //Do not bother checking the last target seen if already fighting
    if(!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            if(GetIsEnemy(GetLastPerceived()))
            {
                if(GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1S5AlarmRaised") == FALSE)
                {
                 ClearAllActions();
                 ActionMoveToObject(GetNearestObjectByTag("WP_M1S5Respond"),TRUE);
                 ActionOpenDoor(GetNearestObjectByTag("M1S5GuardDoor"));
                 ActionMoveToObject(GetNearestObjectByTag("WP_M1S5Respond",OBJECT_SELF,2),TRUE);
                 ActionOpenDoor(GetNearestObjectByTag("M1S5GuardDoor",OBJECT_SELF,2));
                 SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1S5AlarmRaised",TRUE);
                 SetLocalLocation(GetArea(OBJECT_SELF),"NW_G_M1S5RunTo",GetLocation(GetLastPerceived()));
                }
                ActionDoCommand(DetermineCombatRound());
            }
        }
    }
}
