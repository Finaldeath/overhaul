#include "NW_I0_GENERIC"

void main()
{
    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectPolymorph(POLYMORPH_TYPE_WEREWOLF),OBJECT_SELF);
    DetermineCombatRound();
}
