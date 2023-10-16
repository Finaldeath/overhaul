//::///////////////////////////////////////////////
//:: Name q2dn_hb_ballista
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On first Heartbeat for the Ballista - set up
    its visual effects
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 25/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nVfx") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nVfx", 1);

    object oArea = GetArea(OBJECT_SELF);
    vector vSelf = GetPosition(OBJECT_SELF);
    vector vNew = Vector(vSelf.x, vSelf.y, vSelf.z + 2.0);
    location lNew = Location(oArea, vNew, 0.0);

    effect eVfx1 = EffectVisualEffect(VFX_DUR_GLOW_GREY);//cloud
    effect eVfx2 = EffectVisualEffect(VFX_DUR_BLUR); //spellturning
    effect eVfx3 = EffectVisualEffect(VFX_DUR_GHOST_TRANSPARENT);//blindvision
    effect eVfx4 = EffectVisualEffect(VFX_DUR_IOUNSTONE);//quick pulse
    effect eVfx5 = EffectVisualEffect(425); //ghost smoke

    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVfx5, lNew );
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVfx1, OBJECT_SELF);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVfx2, OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVfx4, OBJECT_SELF);
}
