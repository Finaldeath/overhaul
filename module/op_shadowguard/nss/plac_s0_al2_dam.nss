#include "help_general"

void Beam(object oAttacker)
{
    int nMiss = FALSE;

    if (ReflexSave(oAttacker, 10) == 1)
    {
        nMiss = TRUE;

        SendMessageToPC(oAttacker, "[Reflex Save Success]  [You quickly sidestep a great bolt of lightning which rips forth from the altar upon your attack...]");

        AssignCommand(oAttacker, PlayAnimation(ANIMATION_FIREFORGET_DODGE_SIDE));
    }

    else
    {
        SendMessageToPC(oAttacker, "[Reflex Save Failure]  [Upon your attack on the altar, a great beam of lightning erupts from its center, hitting your squarely in the chest...]");

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(3, DAMAGE_TYPE_ELECTRICAL), oAttacker);
    }

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST, nMiss), oAttacker, 4.0);
}

void main()
{
    object o = GetLastDamager();

    if (GetDistanceBetween(o, OBJECT_SELF) < 10.0)
        Beam(o);
}
