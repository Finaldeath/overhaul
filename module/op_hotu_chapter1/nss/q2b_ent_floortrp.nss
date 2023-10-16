//::///////////////////////////////////////////////
//:: Name q2b_ent_floortrp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Life Drain Trap.  On enter of these ancient ruin
    areas - The entering creature will have some of its
    life sucked away
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 12/02
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oCreature = GetEnteringObject();

    effect eDamage = EffectDamage(d20(1) + 5);
    effect vEffect = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, vEffect, oCreature, 6.0);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oCreature);

    if (GetIsPC(oCreature) == TRUE)
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
}
