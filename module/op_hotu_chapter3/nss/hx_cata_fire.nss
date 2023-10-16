//::///////////////////////////////////////////////
//:: Name hx_cata_fire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will show a small cutscene for when the
    catapult is fired.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 2, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void StartCutscene(object oPC, int iCut);
void FireCatapult(object oPC, object oCatapult, object oPrisoner, object oFacing, int iCut, float fFace, object oPCCopy);
void DoDamage(object oPrisoner, object oFacing, object oCatapult, int iCut, object oPC, float fFace, object oPCCopy);
void CreateCreature(object oFacing);
void DelayCreateKnower(location lLoc);

void main()
{
    object oPC = GetPCSpeaker();
    int iCut = 110;

    BlackScreen(oPC);
    // Setup the scene.
    CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
    CutDisableAbort(iCut);
    DelayCommand(0.0, StartCutscene(oPC, iCut));
}


void StartCutscene(object oPC, int iCut)
{
    object oCatapult = OBJECT_SELF;
    CutSetActiveCutsceneForObject(oCatapult, iCut);

    // Cutscene objects.
    object oCopyWP = GetObjectByTag("hx_cut110_pc_copy_wp");
    CutSetActiveCutsceneForObject(oCopyWP, iCut);
    object oPCCopy = CutCreatePCCopy(oPC, GetLocation(oCopyWP), "HX110_PC_COPY");
    CutSetActiveCutsceneForObject(oPCCopy, iCut);
    ChangeToStandardFaction(oPCCopy, STANDARD_FACTION_COMMONER);
    object oFacing = GetLocalObject(OBJECT_SELF, "HX_FINAL_FACING");
    CutSetActiveCutsceneForObject(oFacing, iCut);
    object oPrisoner = GetNearestObjectByTag("hx_frozen_body", oFacing);
    if(GetDistanceBetween(oFacing, oPrisoner) > 4.0)
    {
        oPrisoner = OBJECT_INVALID;
    }
    CutSetActiveCutsceneForObject(oPrisoner, iCut);

    // PC Start.
    location lLoc = GetLocation(oPC);
    // PC camera jump.
    location lLoc2 = GetLocation(GetNearestObjectByTag("hx_cut110_pcjump_wp", oFacing));

    // Facing. Adjust it for a good view of catapult firing.
    float fFace = GetFacing(oCatapult);
    if(fFace >= 15.0)
    {
        fFace = fFace - 15.0;
    }
    else
    {
        fFace = 0.0;
    }

    // Setup the cutscene.
    CutSetCutsceneMode(0.1, oPC, TRUE, TRUE);
    CutSetCamera(0.3, oPC, CAMERA_MODE_TOP_DOWN, fFace, 6.0, 65.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetLocation(0.4, oPC);
    CutJumpToLocation(0.5, oPCCopy, lLoc);
    CutFadeFromBlack(1.5, oPC, FADE_SPEED_FAST);

    // Start the scene.
    CutPlayAnimation(2.0, oPCCopy, ANIMATION_LOOPING_GET_MID, 0.9);
    CutSetCamera(2.8, oPC, CAMERA_MODE_TOP_DOWN, fFace, 8.0, 75.0,
                 CAMERA_TRANSITION_TYPE_MEDIUM);
    DelayCommand(3.0, FireCatapult(oPC, oCatapult, oPrisoner, oFacing, iCut, fFace, oPCCopy));

    if(oPrisoner != OBJECT_INVALID)
    {
        CutJumpToLocation(5.0, oPC, lLoc2);
        CutSetCamera(5.0, oPC, CAMERA_MODE_TOP_DOWN, fFace, 3.0, 75.0,
                     CAMERA_TRANSITION_TYPE_SNAP);
    }
}

void FireCatapult(object oPC, object oCatapult, object oPrisoner, object oFacing, int iCut, float fFace, object oPCCopy)
{
    CutPlaySound(0.1, oCatapult, "sca_dragfire");
    CutActionCastSpellAtLocation(0.2, SPELL_FIREBALL, oCatapult, GetLocation(oFacing), METAMAGIC_ANY, 0, PROJECTILE_PATH_TYPE_BALLISTIC);
    if(oPrisoner != OBJECT_INVALID)
    {
        //CutApplyEffectToObject(0.8, DURATION_TYPE_INSTANT, VFX_IMP_HEALING_X, oCatapult);
        CutApplyEffectToObject(2.8, DURATION_TYPE_PERMANENT, VFX_DUR_PROT_SHADOW_ARMOR, oCatapult);
    }
    DelayCommand(1.9, DoDamage(oPrisoner, oFacing, oCatapult, iCut, oPC, fFace, oPCCopy));
}

void DoDamage(object oPrisoner, object oFacing, object oCatapult, int iCut, object oPC, float fFace, object oPCCopy)
{
    if(oPrisoner != OBJECT_INVALID)
    {
        location lLoc = GetLocation(oPrisoner);
        vector vPos = GetPosition(oFacing);
        vector vNew = Vector(vPos.x, vPos.y + 1.0, vPos.z);

        location lLoc2 = Location(GetArea(oFacing), vNew, 0.0);
        location lLoc3 = GetLocation(GetObjectByTag("hx_cut110_pcendjump_wp"));
        location lLoc4 = GetLocation(GetObjectByTag("hx_cut110_spawn_knower_wp"));

        int x = 1;
        object oIce = GetNearestObjectByTag("hx_ice_tile", oPrisoner);
        object oInvis = GetNearestObjectByTag("hx_prison_block", oPrisoner, x);

        // Set the catapult inoperable.
        SetLocalInt(OBJECT_SELF, "HX_CATAPULT_BEEN_FIRED", 1);

        // Destroy the Ice effect.
        DestroyObject(oIce);

        // Destroy the invis barriers around the prison.
        while(x < 7)
        {
            DestroyObject(oInvis);
            x = x + 1;
            oInvis = GetNearestObjectByTag("hx_prison_block", oPrisoner, x);
        }

        CutApplyEffectAtLocation(0.0, oCatapult, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, GetLocation(oFacing));
        CutApplyEffectAtLocation(0.8, oCatapult, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, lLoc2);
        CutApplyEffectAtLocation(0.3, oCatapult, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, GetLocation(oFacing));

        DelayCommand(1.0, CreateCreature(oFacing));

        // End scene.
        if(GetTag(oFacing) == "hx_catapult_facing_03")
        {
            // Set the camera.
            CutJumpToLocation(9.0, oPCCopy, lLoc3);
            CutSetCamera(11.0, oPC, CAMERA_MODE_TOP_DOWN, fFace, 6.0, 65.0,
                        CAMERA_TRANSITION_TYPE_SNAP);
            CutJumpToLocation(11.0, oPC, lLoc3);

            // Have knower fly in.
            DelayCommand(10.5, DelayCreateKnower(lLoc4));
            CutPlaySound(12.0, oPC, "fs_flapfeather");
            CutSetLocation(12.0, oPC);
            CutFadeOutAndIn(14.5, oPC, 2.0);
            CutDisableCutscene(iCut, 15.0, 15.0, RESTORE_TYPE_NORMAL);
            DelayCommand(4.5, DestroyObject(oPrisoner));
            DelayCommand(14.0, SetLocalInt(oPC, "HX_PC_STANDING_NEAR", 1));
            DelayCommand(16.8, AssignCommand(oPC, ClearAllActions(TRUE)));
            DelayCommand(16.8, AssignCommand(GetObjectByTag("hx_knower_names2"), ActionStartConversation(oPC)));
            DelayCommand(18.0, SetLocalInt(oPC, "HX_PC_STANDING_NEAR", 0));
        }
        else
        {
            CutFadeOutAndIn(9.5, oPC, 2.0);
            CutDisableCutscene(iCut, 10.0, 10.0, RESTORE_TYPE_NORMAL);
            DelayCommand(4.5, DestroyObject(oPrisoner));
        }
    }
    // Just do an explosion and end the scene.
    else
    {
        CutApplyEffectAtLocation(0.3, oCatapult, DURATION_TYPE_INSTANT, VFX_FNF_FIREBALL, GetLocation(oFacing));
        CutApplyEffectAtLocation(0.3, oCatapult, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, GetLocation(oFacing));
        // End scene.
        CutFadeOutAndIn(1.0, oPC, 1.5);
        CutDisableCutscene(iCut, 2.0, 2.0, RESTORE_TYPE_NORMAL);
    }
}

void CreateCreature(object oFacing)
{
    object oSound = GetObjectByTag("hx_prisoner_sound");
    object oSound2 = GetObjectByTag("hx_knower_sound");

    // Knower of Names.
    if(GetTag(oFacing) == "hx_catapult_facing_03")
    {
        SetLocalInt(GetModule(), "HX_KNOWER_APPEARED", TRUE);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oFacing));
        CutCreateObject(3.0, oFacing, OBJECT_TYPE_CREATURE, "hx_knower_names", GetLocation(oFacing), EFFECT_TYPE_INVALIDEFFECT);
        DelayCommand(3.5, SoundObjectPlay(oSound2));
        DelayCommand(8.0, SoundObjectStop(oSound2));
    }
    else
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oFacing));
        if(Random(100) > 50)
        {
            CutCreateObject(3.0, oFacing, OBJECT_TYPE_CREATURE, "hx_knower_devil1", GetLocation(oFacing), EFFECT_TYPE_INVALIDEFFECT);
        }
        else
        {
            CutCreateObject(3.0, oFacing, OBJECT_TYPE_CREATURE, "hx_knower_devil2", GetLocation(oFacing), EFFECT_TYPE_INVALIDEFFECT);
        }
        DelayCommand(4.0, SoundObjectPlay(oSound));
        DelayCommand(8.0, SoundObjectStop(oSound));
    }
}

void DelayCreateKnower(location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, "hx_knower_names2", lLoc);
}
