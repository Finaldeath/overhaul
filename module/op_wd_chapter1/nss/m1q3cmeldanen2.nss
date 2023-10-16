#include "NW_I0_GENERIC"
void main()
{
    if(!GetIsObjectValid(GetAttackTarget()) &&
       !GetIsObjectValid(GetAttemptedSpellTarget()) &&
       GetLastPerceptionSeen() &&
       GetIsEnemy(GetLastPerceived()))
    {

        SetFacingPoint(GetPosition(GetLastPerceived()));
        SpeakOneLinerConversation();
        DetermineCombatRound();
    }
}
