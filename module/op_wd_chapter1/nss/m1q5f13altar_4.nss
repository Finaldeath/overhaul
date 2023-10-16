// * Patch 2
// * Made it so this loop *should* iterate properly - Brent

#include "NW_I0_Plot"
void main()
{
    int nNth = 1;
    object oUndead = GetNearestCreature (CREATURE_TYPE_RACIAL_TYPE,RACIAL_TYPE_UNDEAD, OBJECT_SELF, nNth);
    while (GetIsObjectValid(oUndead))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(TRUE),oUndead);
        nNth = nNth + 1;
        oUndead = GetNearestCreature (CREATURE_TYPE_RACIAL_TYPE,RACIAL_TYPE_UNDEAD, OBJECT_SELF, nNth);

    }
    DestroyObject(GetNearestObjectByTag("M1Q5AltarLight"));
    RewardXP("M1Q1_Begg_1",100,GetLastKiller());
}
