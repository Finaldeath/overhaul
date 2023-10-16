//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_sphere
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will fire the globe effect to the ground.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 15, 2003
//:://////////////////////////////////////////////
#include "x2_inc_toollib"
void DelayCreate(location lLoc);

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
        object oSound = GetObjectByTag("hx_squash_sound");
        object oPrisoner = GetObjectByTag("hx_squash_corpse");

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPrisoner);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), OBJECT_SELF);
        ActionCastSpellAtLocation(782, GetLocation(GetObjectByTag("hx_fireden_sphere_wp")), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        //TLVFXPillar(VFX_IMP_GLOBE_USE, GetLocation(OBJECT_SELF), 6, 0.1, 6.0, -1.0);
        DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_MEDIUM), GetLocation(GetObjectByTag("hx_fireden_sphere_wp"))));
        DelayCommand(0.3, SoundObjectPlay(oSound));
        DelayCommand(0.5, DelayCreate(GetLocation(GetObjectByTag("hx_fireden_sphere_wp"))));
        DelayCommand(2.0, SoundObjectStop(oSound));
        DelayCommand(3.0, DestroyObject(OBJECT_SELF));
    }
}

void DelayCreate(location lLoc)
{
    DelayCommand(0.7, PlaySound("it_gem"));
    CreateObject(OBJECT_TYPE_PLACEABLE, "grap_item_che002", lLoc);
}
