//::///////////////////////////////////////////////
//:: Name hx_anchor_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Creates a beam effect holding the prisoner
     up in the air.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 15, 2003
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetNearestObjectByTag("hx_anchor_target");

    if(GetArea(OBJECT_SELF) == GetArea(GetFirstPC()))
    {
        if(GetDistanceToObject(GetFirstPC()) <= 50.0)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST), oTarget, 7.0);
        //DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST), oTarget, 0.5));
        //DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST), oTarget, 0.5));
        //DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST), oTarget, 0.5));
        //DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST), oTarget, 0.5));
        //DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST), oTarget, 0.5));
        }
    }
}
