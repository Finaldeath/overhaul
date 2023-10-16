#include "NW_I0_GENERIC"
void main()
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectInvisibility(INVISIBILITY_TYPE_NORMAL),OBJECT_SELF);
    SetLocalInt(OBJECT_SELF,"NW_L_GorkanAttack",GetLocalInt(OBJECT_SELF,"NW_L_GorkanAttack") + 1);
    DetermineCombatRound();
}
