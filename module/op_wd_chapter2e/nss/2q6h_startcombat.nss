#include "nw_i0_generic"
void main()
{
    ActionPauseConversation();
    ClearAllActions();
    ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT);
    //ActionWait(1.0);
    ActionDoCommand(DetermineCombatRound());
    ActionResumeConversation();
}
