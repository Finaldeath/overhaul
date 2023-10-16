//::///////////////////////////////////////////////
//:: Name: q2e_use_breweq
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create a random negative AOE when the brewing
    equipment is used...
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 19/02
//:://////////////////////////////////////////////


void main()
{
    location lTarget = GetLocation(OBJECT_SELF);
    effect eEffect = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL);
    effect eEffect2;
    switch (Random(4))
    {
        case 0: eEffect2 = EffectAreaOfEffect(AOE_PER_FOGACID);
                break;
        case 1: eEffect2 = EffectAreaOfEffect(AOE_PER_FOGFIRE);
                break;
        case 2: eEffect2 = EffectAreaOfEffect(AOE_PER_FOGSTINK);
                break;
        case 3: eEffect2 = EffectAreaOfEffect(AOE_PER_FOGMIND);
                break;



    }

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lTarget);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eEffect2, lTarget, 12.0);
}
