// Swinging blades from above...

#include "X0_I0_SPELLS"

void main()
{
    object oFocus = GetNearestObjectByTag("q6_wp_blades_focus");
    vector vPos = GetPosition(oFocus);
    location lLoc = Location(GetArea(OBJECT_SELF), vPos, 180.0);
    effect eBlades = EffectVisualEffect(VFX_FNF_SWINGING_BLADE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBlades, lLoc);
    object oTarget = GetFirstObjectInShape(SHAPE_CUBE, 3.0, GetLocation(oFocus));
    int nDamage;
    effect eDamage;
    effect eKnock = EffectKnockdown();
    effect eBlood;

    while(oTarget != OBJECT_INVALID)
    {
        // save vs. reflex or get nailed by the blades:
        if (!MySavingThrow(SAVING_THROW_REFLEX, oTarget, 32, SAVING_THROW_TYPE_TRAP))
        {
            nDamage = d6(10);
            eDamage = EffectDamage(nDamage, DAMAGE_TYPE_SLASHING);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oTarget, 4.0));
            if(GetRacialType(oTarget) == RACIAL_TYPE_CONSTRUCT)
                eBlood = EffectVisualEffect(VFX_COM_CHUNK_STONE_MEDIUM);
            else if(GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
                eBlood = EffectVisualEffect(VFX_COM_CHUNK_YELLOW_MEDIUM);
            else
                eBlood = EffectVisualEffect(VFX_COM_CHUNK_RED_MEDIUM);
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBlood, oTarget));

        }
        else // duck animation
        {
            AssignCommand(oTarget, ClearAllActions());
            AssignCommand(oTarget, PlayAnimation(ANIMATION_FIREFORGET_DODGE_DUCK, 1.0));
        }
        oTarget = GetNextObjectInShape(SHAPE_CUBE, 3.0, GetLocation(oFocus));
    }
    DestroyObject(OBJECT_SELF, 6.0);

}
