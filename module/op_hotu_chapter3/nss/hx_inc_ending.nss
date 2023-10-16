//::///////////////////////////////////////////////
//:: Name hx_inc_ending
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This include will handle all objects and
     functions needed for the ending.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 22, 2003
//:://////////////////////////////////////////////
#include "x2_inc_toollib"
#include "x2_inc_cutscene"

// PC.
object oPC = GetFirstPC();

// Cutscene number.
int iCut = 998;

// Other actors.
object oScribe = GetNearestObjectByTag("hx_fend_scribe", oPC);
object oDurnan = GetNearestObjectByTag("hx_fend_durnan", oPC);
object oDaelan = GetNearestObjectByTag("hx_fend_daelan", oPC);
object oTomi = GetNearestObjectByTag("hx_fend_tomi", oPC);
object oLinu = GetNearestObjectByTag("hx_fend_linu", oPC);
object oSharwyn = GetNearestObjectByTag("hx_fend_sharwyn", oPC);
object oSeer1 = GetNearestObjectByTag("hx_fend_seer1", oPC);
object oSeer2 = GetNearestObjectByTag("hx_fend_seer2", oPC);
object oIllithid = GetNearestObjectByTag("hx_fend_illithid", oPC);
object oGnome = GetNearestObjectByTag("hx_fend_gnome", oPC);
object oDevil = GetNearestObjectByTag("hx_fend_devil", oPC);
object oSleep = GetNearestObjectByTag("hx_fend_sleep", oPC);
object oSleep2 = GetNearestObjectByTag("hx_fend_sleep2", oPC);
object oAriEvil = GetNearestObjectByTag("hx_fend_ari_e", oPC);
object oAriGood = GetNearestObjectByTag("hx_fend_ari_g", oPC);
object oAribeth3 = GetNearestObjectByTag("hx_fend_ari3", oPC);
object oNathyrra = GetNearestObjectByTag("hx_fend_nath", oPC);
object oValen = GetNearestObjectByTag("hx_fend_valen", oPC);
object oDeekin = GetNearestObjectByTag("hx_fend_deekin", oPC);
object oKnow = GetNearestObjectByTag("hx_fend_know", oPC);
object oNathyrra2 = GetNearestObjectByTag("hx_fend_nath2", oPC);
object oValen2 = GetNearestObjectByTag("hx_fend_valen2", oPC);
object oDeekin2 = GetNearestObjectByTag("hx_fend_deekin2", oPC);

// Locations.
location lPCStart = GetLocation(GetNearestObjectByTag("hx_fend_pc_start_wp", GetFirstPC()));
location lPCJumpTemp = GetLocation(GetNearestObjectByTag("hx_fend_pc_temp_wp", GetFirstPC()));
location lPCEnd = GetLocation(GetNearestObjectByTag("hx_fend_final_pc_wp", GetFirstPC()));

// PC jump locations.
location lPCJump;
location lPCRun;

// Lighting.
object oLight = OBJECT_INVALID;
int iLight = 0;

// Old Light and Old Actor.
object oOldLight = OBJECT_INVALID;
object oActor = OBJECT_INVALID;

// Cameras.
// First Camera.
float fFacing1 = 0.0;
float fZoom1 = 0.0;
float fPitch1 = 0.0;
// Second Camera.
float fFacing2 = 0.0;
float fZoom2 = 0.0;
float fPitch2 = 0.0;

// Music.
int iTrack = 0;

// Grave.
object oGrave = OBJECT_INVALID;
int iGrave = FALSE;

/////////////////////////////////////////////////////////

// Set Current Actor and Light.
void SetCurrentActorAndLight(object oActor, object oLight, object oGrave, int iLight);
// Get Current Actor.
object GetCurrentActor();
// Get Current Light.
object GetCurrentLight();
// Kill old actor and light.
void PurgeActorAndLight();
// Remove invis from current actor.
void RemoveInvis(object oActor);
// Play teleport sound when actor zooms in.
void PlayTeleportSound();
// Get Current Grave.
object GetCurrentGrave();

/////////////////////////////////////////////////////////


// Set Current Actor and Light, and any grave.
void SetCurrentActorAndLight(object oActor, object oLight, object oGrave, int iLight)
{
    SetLocalObject(GetModule(), "HX_FEND_ACTOR", oActor);
    SetLocalObject(GetModule(), "HX_FEND_LIGHT", oLight);
    SetLocalObject(GetModule(), "HX_FEND_GRAVE", oGrave);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iLight), oLight);
}

// Get Current Actor.
object GetCurrentActor()
{
    object oMod = OBJECT_INVALID;
    oMod = GetLocalObject(GetModule(), "HX_FEND_ACTOR");
    return oMod;
}

// Get Current Light.
object GetCurrentLight()
{
    object oMod = OBJECT_INVALID;
    oMod = GetLocalObject(GetModule(), "HX_FEND_LIGHT");
    return oMod;
}

// Get Current Grave.
object GetCurrentGrave()
{
    object oMod = OBJECT_INVALID;
    oMod = GetLocalObject(GetModule(), "HX_FEND_GRAVE");
    return oMod;
}

// Kill old actor and light (and any graves).
void PurgeActorAndLight()
{
    object oActor = GetCurrentActor();
    object oLight = GetCurrentLight();
    object oGrave = GetCurrentGrave();

    if(GetIsObjectValid(oActor))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oActor);
        if(GetPlotFlag(oActor) == TRUE)
        {
            SetPlotFlag(oActor, FALSE);
        }
        if(GetImmortal(oActor) == TRUE)
        {
            SetImmortal(oActor, FALSE);
        }
        DestroyObject(oActor, 0.5);
        DeleteLocalObject(GetModule(), "HX_FEND_ACTOR");
    }
    if(GetIsObjectValid(oLight))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oLight);
        DestroyObject(oLight, 0.5);
        DeleteLocalObject(GetModule(), "HX_FEND_LIGHT");
    }
    if(GetIsObjectValid(oGrave))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oGrave);
        DestroyObject(oGrave, 0.5);
        DeleteLocalObject(GetModule(), "HX_FEND_GRAVE");
    }
}

// Remove invis from current actor.
void RemoveInvis(object oActor)
{
    effect eEffect = GetFirstEffect(oActor);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oActor, eEffect);
        eEffect = GetNextEffect(oActor);
    }
}

// Play teleport sound when actor zooms in.
void PlayTeleportSound()
{
    object oSound = GetNearestObjectByTag("hx_fend_tp_sound", oPC);

    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        SoundObjectPlay(oSound);
    }
}
