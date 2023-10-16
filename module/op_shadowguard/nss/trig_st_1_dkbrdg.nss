#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oWP = GetNearestObjectByTag("MP_TO_MARKET_DIST", oPC);

            location lWP = GetLocation(oWP);

            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lWP);

            SceneSpeak(oPC, "[As you reach the other end of the stone bridge, yet another explosion erupts along its foundations, barring any return to the Market District...]");
        }
    }
}
