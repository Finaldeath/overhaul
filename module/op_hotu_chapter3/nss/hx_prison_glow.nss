//::///////////////////////////////////////////////
//:: Name hx_prison_glow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create a glow for the ice prisons.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 20. 2003
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_ONCE") == 0)
    {
        SetLocalInt(OBJECT_SELF, "NW_L_ONCE", 1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_PURPLE), OBJECT_SELF);
    }
}
