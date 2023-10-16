//* Check if any Former Guards are left
#include "NW_I0_GENERIC"
void main()
{
    object oFormerGuard = GetNearestObjectByTag("M1Q2_INTFORGUAR");
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if(GetIsObjectValid(oFormerGuard) && GetCommandable(oFormerGuard))
    {
        ClearAllActions();
        SignalEvent(OBJECT_SELF,EventUserDefined(1));
        ActionAttack(oFormerGuard);
        SetLocalObject(OBJECT_SELF,"NW_G_M1Q2DevTarget",oFormerGuard);
    }
    else
    {
        if(!GetIsObjectValid(GetAttemptedAttackTarget()) &&
           !GetIsObjectValid(GetAttemptedSpellTarget()) &&
           GetIsObjectValid(GetLastAttacker()))
        {
            DetermineCombatRound();
        }
    }
}
