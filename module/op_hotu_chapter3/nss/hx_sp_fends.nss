//::///////////////////////////////////////////////
//:: Name hx_sp_fends
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn for ending creatures. Turns them invis.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 22, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSelf = OBJECT_SELF;
    effect eEffect = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oSelf);
}
