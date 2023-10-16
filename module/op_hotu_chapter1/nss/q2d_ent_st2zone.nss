//::///////////////////////////////////////////////
//:: Name: q2d_ent_st2zone
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Level III Undermountain - Special Trap II on enter
    trigger.
    On enter of this trigger, if the module's variable
    for this particular trigger is active - do damage
    to the creature entering the trigger.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 20/02
//:://////////////////////////////////////////////

void main()
{
    //if the trigger is active
    if (GetLocalInt(GetModule(), "n" + GetTag(OBJECT_SELF)) == 1)
    {
        if (GetLocalInt(GetModule(), "nSpecTrap2Active") != 0)
        {
            object oCreature = GetEnteringObject();
            effect eDamage = EffectDamage(d10());
            effect eVis;
            if (GetTag(OBJECT_SELF) == "Q2D_STrap2_Zone16_17" || GetTag(OBJECT_SELF) == "Q2D_STrap2_Zone14_15")
            {
                eVis = EffectVisualEffect(VFX_COM_HIT_ELECTRICAL);
            }
            else
            {
                eVis = EffectVisualEffect(VFX_COM_HIT_FIRE);
            }
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectLinkEffects(eDamage, eVis), oCreature);
        }
    }
}
