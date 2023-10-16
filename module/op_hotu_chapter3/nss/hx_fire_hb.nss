//::///////////////////////////////////////////////
//:: Name hx_fire_hb
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will keep track of how long a fire will
     last that is made by the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 15, 2003
//:://////////////////////////////////////////////

void main()
{
    int iTime = GetLocalInt(OBJECT_SELF, "HX_FIRE_TIME");

    if(iTime >= 10)
    {
        location lLoc = GetLocation(OBJECT_SELF);
        object oSound = GetNearestObjectByTag("velox_camp_sound");

        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lLoc);
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SoundObjectStop(oSound);
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "HX_FIRE_TIME", iTime + 1);
    }
}
