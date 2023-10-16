//::///////////////////////////////////////////////
//:: Name q2bn_use_mazelv1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Deactivate two of the traps in the maze room

*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: November 4/03
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
    PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    PlaySound("sim_exp2light");

    object oTrap1 = GetObjectByTag("q2bn_targetpillar_1", 1);
    object oTrap2 = GetObjectByTag("q2bn_targetpillar_2", 1);

    effect eDamage = EffectDamage(100);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(477), GetLocation(oTrap1));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(477), GetLocation(oTrap2));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTrap1);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTrap2);
}
