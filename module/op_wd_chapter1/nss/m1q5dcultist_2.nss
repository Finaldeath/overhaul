#include "NW_I0_GENERIC"

void main()
{
    //Do not bother checking the last target seen if already fighting
    if(!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            if(GetIsEnemy(GetLastPerceived()) && GetLocalInt(OBJECT_SELF,"NW_L_M1Q5DRitualStarted") == FALSE)
            {
                object oArea = GetArea(OBJECT_SELF);
                 ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP,1.0,6.0);
                 SetLocalInt(OBJECT_SELF,"NW_L_M1Q5DRitualStarted",TRUE);
                 //DelayCommand(9.5,SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(501)));
                 SpeakOneLinerConversation();
                 DelayCommand(12.0,SignalEvent(oArea,EventUserDefined(0)));
                 //DelayCommand(9.6,ClearAllActions());
                 DelayCommand(12.0,ActionDoCommand(DetermineCombatRound()));
            }
        }
    }
}
