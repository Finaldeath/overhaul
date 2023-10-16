#include "inc_module"

void main()
{
    object oPC = GetExitingObject();

    if (oPC == GetAreaOfEffectCreator(OBJECT_SELF))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal( GetMaxHitPoints(oPC) ), oPC);

        RemoveAllEffects(oPC);
        MovePlayerToStartLocation(oPC);

        SetObserver(oPC, FALSE);
    }
}
