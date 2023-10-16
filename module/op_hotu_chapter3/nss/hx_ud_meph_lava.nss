//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_meph_build
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will handle the building morphs for the
     Mephistopholes end-fight.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 5, 2003
//:://////////////////////////////////////////////
#include "x2_inc_toollib"
#include "hx_inc_meph"

// Swap building visual effect so that it appears destroyed.
void DestroyBuilding();
// Visuals for the building exploding.
void ExplodeBuilding(int iVFX);
// Destroy any PC Blocker objects that should not be there after switch.
void ExplodeBlockers();
// DelayCreate.
void DelayCreateObject(int iType, string sRes, location lLoc, object oSound);
// Delay Create 2 (creature)
void DelayCreate(int iType, string sRes, location lLoc);

void main()
{
    int nUser = GetUserDefinedEventNumber();
    // Fire.
    if(nUser == 4444)
    {
        object oSound = GetObjectByTag("hx_lava_sound");

        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIRESTORM), OBJECT_SELF);
        //DelayCommand(1.7, ExplodeBuilding(VFX_FNF_FIREBALL));
        //DelayCommand(2.2, DestroyBuilding());
        // Create elemental.
        DelayCommand(1.0, DelayCreateObject(OBJECT_TYPE_CREATURE, "hx_fireelem", GetLocation(OBJECT_SELF), oSound));

    }
    // Ice.
    if(nUser == 5555)
    {
        object oSound = GetObjectByTag("hx_ice_sound");
        int iTimes = GetLocalInt(GetArea(OBJECT_SELF), "HX_ELEM_TIMES");

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ICESTORM), OBJECT_SELF);
        DelayCommand(1.7, ExplodeBuilding(VFX_IMP_FROST_L));
        DelayCommand(2.2, DestroyBuilding());
        // Create elemental.
        DelayCommand(2.5, DelayCreateObject(OBJECT_TYPE_CREATURE, "hx_iceelem", GetLocation(OBJECT_SELF), oSound));

        if(iTimes == 0)
        {
            SetLocalInt(GetArea(OBJECT_SELF), "HX_ELEM_TIMES", 1);
            DelayCommand(8.0, SignalEvent(GetNearestObjectByTag(GetTag(OBJECT_SELF)), EventUserDefined(5555)));
        }
        else if(iTimes == 1)
        {
            SetLocalInt(GetArea(OBJECT_SELF), "HX_ELEM_TIMES", 2);
            DelayCommand(8.0, SignalEvent(GetNearestObjectByTag(GetTag(OBJECT_SELF)), EventUserDefined(5555)));
        }
        else if(iTimes == 2)
        {
            SetLocalInt(GetArea(OBJECT_SELF), "HX_ELEM_TIMES", 0);
        }
    }
    // Water.
    if(nUser == 6666)
    {
        object oSound = GetObjectByTag("hx_water_sound");

        ExplodeBuilding(VFX_IMP_ACID_S);
        DelayCommand(0.5, DestroyBuilding());
        // Create elemental.
        DelayCommand(0.8, DelayCreateObject(OBJECT_TYPE_CREATURE, "hx_waterelem", GetLocation(OBJECT_SELF), oSound));
    }
}

void DestroyBuilding()
{
    int iVFX = StringToInt(GetStringRight(GetName(OBJECT_SELF), 3));
    effect eEffect = GetFirstEffect(OBJECT_SELF);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(OBJECT_SELF, eEffect);
        eEffect = GetNextEffect(OBJECT_SELF);
    }

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iVFX), OBJECT_SELF);

    object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_meph_dest_fin", GetLocation(OBJECT_SELF));

    // Apply the destroyed effect to the new object. Make self invis.
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iVFX), oNew);
    DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), OBJECT_SELF));
    DestroyObject(OBJECT_SELF, 12.5);

}

void ExplodeBuilding(int iVFX)
{
    location lLoc1 = GetLocation(GetNearestObjectByTag("hx_meph_explosion", OBJECT_SELF, 1));
    location lLoc2 = GetLocation(GetNearestObjectByTag("hx_meph_explosion", OBJECT_SELF, 2));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(iVFX), OBJECT_SELF);

    DelayCommand(0.1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(iVFX), lLoc1));
    DelayCommand(0.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(iVFX), lLoc2));
    DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc1));
    DelayCommand(0.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc2));
    DelayCommand(0.5, ExplodeBlockers());
}

void ExplodeBlockers()
{
    object oBlock = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
    string sName;

    while(GetIsObjectValid(oBlock))
    {
        sName = GetName(oBlock);
        if(GetStringLeft(sName, 11) == "MephDestroy" || sName == "Meph Building Door")
        {
            DestroyObject(oBlock);
        }
        oBlock = GetNextObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(OBJECT_SELF), FALSE, OBJECT_TYPE_PLACEABLE);
    }
}

// DelayCreate.
void DelayCreateObject(int iType, string sRes, location lLoc, object oSound)
{

    // Lava
    if(sRes == "hx_fireelem")
    {
        int x = 1;
        object oFire = GetNearestObjectByTag("hx_fire_shot", OBJECT_SELF, x);

        if(GetLevelType(GetArea(OBJECT_SELF)) != 1)
        {
            SoundObjectPlay(oSound);
            TLChangeAreaGroundTiles(GetArea(OBJECT_SELF), X2_TL_GROUNDTILE_LAVA, 8, 8, 1.3);
            DelayCommand(0.2, DayToNight(GetFirstPC(), 2.0));
        }
        //while(x < 5)
        //{
        //    AssignCommand(oFire, DelayCommand(2.0, ActionCastFakeSpellAtLocation(772, lLoc)));
        //    x = x + 1;
        //    oFire = GetNearestObjectByTag("hx_fire_shot", OBJECT_SELF, x);
       // }

        //DelayCommand(4.8, DelayCreate(iType, sRes, lLoc));
        DelayCommand(1.0, SetLevelType(GetArea(OBJECT_SELF), 1));
    }
    else if(sRes == "hx_iceelem")
    {
        // Ice
        object oIce = OBJECT_SELF;
        object oSound2 = GetObjectByTag("hx_coldspell_sound");

        if(GetLevelType(GetArea(OBJECT_SELF)) != 2)
        {
            SoundObjectPlay(oSound);
            DelayCommand(1.3, TLChangeAreaGroundTiles(GetArea(OBJECT_SELF), X2_TL_GROUNDTILE_ICE, 8, 8, 0.3));
            DelayCommand(0.1, SetWeather(GetArea(OBJECT_SELF), WEATHER_SNOW));
        }
        DelayCommand(1.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION), lLoc));
        DelayCommand(0.8, SoundObjectPlay(oSound2));
        DelayCommand(8.0, SoundObjectStop(oSound2));
        DelayCommand(0.5, TLVFXPillar(VFX_IMP_FROST_L, lLoc, 6, 0.2, 6.0, -1.0));

        DelayCommand(2.5, DelayCreate(iType, sRes, lLoc));
        DelayCommand(1.0, SetLevelType(GetArea(OBJECT_SELF), 2));
    }
    else
    {
        // Water
        object oWater = OBJECT_SELF;
        object oSound3 = GetObjectByTag("hx_watspell_sound");

        SoundObjectPlay(oSound);

        DelayCommand(2.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_ACID), OBJECT_SELF, 6.0));
        DelayCommand(1.8, SoundObjectPlay(oSound3));
        DelayCommand(9.0, SoundObjectStop(oSound3));
        DelayCommand(1.5, TLVFXPillar(VFX_IMP_ACID_S, lLoc, 4, 0.2, 5.0, -1.0));

        DelayCommand(2.7, DelayCreate(iType, sRes, lLoc));
        TLChangeAreaGroundTiles(GetArea(OBJECT_SELF), X2_TL_GROUNDTILE_SEWER_WATER, 8, 8, 2.4);
        DelayCommand(1.0, SetLevelType(GetArea(OBJECT_SELF), 3));
        DelayCommand(0.1, SetWeather(GetArea(OBJECT_SELF), WEATHER_RAIN));
    }
}

// Delay Create 2 (creature).
void DelayCreate(int iType, string sRes, location lLoc)
{
    if(sRes == "hx_fireelem")
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc);
        DelayCommand(0.7, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), lLoc));
        CreateObject(iType, sRes, lLoc);
    }
    else
    {
        CreateObject(iType, sRes, lLoc);
    }
}
