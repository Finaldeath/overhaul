//::///////////////////////////////////////////////
//:: Name hx_final_enter2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Part 2 of the end cutscene. This will have
     Meph crash in.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 3, 2003
//:://////////////////////////////////////////////
#include "x2_inc_toollib"
#include "hx_inc_meph"
#include "x2_inc_cutscene"
// Standard cutscene start
void StartCutscene(object oPC, int iCut);
// Change Track based on night.
void SetMusic(int iCut, object oPC);
// Day/Night switch
void DoDayToNight(int iCut, object oPC, float fTime = 14.0);
// Play sound object.
void CutPlaySoundObject(int iCut, object oSound);
// Create a fire trail.
void CutCreateFire(int iCut, object oPC);
// Create corpse fire.
void CutMakeCorpseFire(int iCut, object oDead);
// Make Meph appear.
void RevealMeph(int iCut, object oMeph);
// Make Meph appear.
void DestroyBuilding(int iCut, object oMeph);
// Blow up the building.
void ExplodeBuilding(int iCut, object oMeph);
// Fill area with lava.
void MakeLava(int iCut, object oMeph);
// Clear area of lava.
void ClearLava(int iCut, object oMeph);
// Kill everyone but Meph and PC.
void KillEveryone(int iCut, object oMeph, object oCopy, object oPC, object oDurnan);
// DelayCreate.
void DelayCreate(int iCut, object oMeph, int iType, string sRes, location lLoc);
// Kill wizard visual.
void KillRing(int iCut, object oPC);
// Restore PC.
void RestorePCAppearance(object oPC, int iCut);

void main()
{
    object oPC = GetPCSpeaker();
    int iCut = 300;
    object oInvis = GetObjectByTag("hx_finalcut_runner");

    AssignCommand(oInvis, StartCutscene(oPC, iCut));
}

void StartCutscene(object oPC, int iCut)
{
      location lLoc = GetLocation(GetObjectByTag("hx_end_battle_copy_spawn_wp"));

      // Cutscene objects other than the PC.
      object oMeph = GetNearestObjectByTag("hx_meph", oPC);
      object oMeph2 = GetNearestObjectByTag("hx_meph_crystalx", oPC);
      object oDurnan = GetNearestObjectByTag("hx_end_fight_durnan", oPC);
      object oInvis = GetNearestObjectByTag("hx_final_grapple_invis", oPC);
      CutSetActiveCutsceneForObject(oInvis, iCut);
      object oCaster = GetNearestObjectByTag("hx_end_waterdeep3x", oDurnan);
      CutSetActiveCutsceneForObject(oCaster, iCut);

      // PC Copy.
      object oPCCopy = GetObjectByTag("HX_PC_COPY_FINAL");
      object oSound2 = GetNearestObjectByTag("hx_crystal_fire_explode", oPC);
      object oSound3 = GetNearestObjectByTag("hx_final_pc_appear", oPC);
      object oSound4 = GetNearestObjectByTag("hx_final_meph_appear", oPC);

      // Waypoints.
      location lPCCopyStart = GetLocation(GetNearestObjectByTag("hx_final_fight_pc_start", oPC));
      location lPCStart = GetLocation(GetNearestObjectByTag("hx_end_battle_pc_start_wp", oPC));
      location lPCMove1 = GetLocation(GetNearestObjectByTag("hx_end_battle_pc_move1_wp", oPC));
      location lPCMove2 = GetLocation(GetNearestObjectByTag("hx_end_battle_pc_move2_wp", oPC));
      location lMephStart = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp", oPC));
      location lRealMeph = GetLocation(GetNearestObjectByTag("hx_meph_start_wp", oPC));
      location lMephMove = GetLocation(GetNearestObjectByTag("hx_final_meph_move_wp", oPC));
      location lGrapple = GetLocation(GetNearestObjectByTag("hx_final_pc_grapple_wp", oPC));
      location lPCMove3 = GetLocation(GetNearestObjectByTag("hx_end_battle_pc_grap_wp", oPC));
      location lDurnan = GetLocation(GetNearestObjectByTag("hx_end_battle_durnan_wp", oPC));

      // Continue the cutscene.
      DelayCommand(2.0, SetMusic(iCut, oPC));
      DoDayToNight(iCut, oPC, 8.0);
      CutPlayAnimation(0.0, oMeph, ANIMATION_LOOPING_GET_LOW, 4.0);
      CutPlaySoundObject(iCut, oSound4);
      CutApplyEffectAtLocation(0.1, oPC, DURATION_TYPE_INSTANT, 464, lRealMeph);

      CutActionMoveToLocation(0.2, oPC, lPCMove2, TRUE);
      CutSetCamera(0.2, oPC, CAMERA_MODE_TOP_DOWN, 92.0, 2.0, 100.0,
                   CAMERA_TRANSITION_TYPE_VERY_FAST);

      DelayCommand(0.8, ExplodeBuilding(iCut, oMeph));
      DelayCommand(1.3, DestroyBuilding(iCut, oMeph));
      DelayCommand(2.0, RevealMeph(iCut, oMeph));

      CutActionMoveToLocation(6.2, oPC, lPCMove1, FALSE);
      CutSetCamera(6.2, oPC, CAMERA_MODE_TOP_DOWN, 120.0, 7.5, 88.0,
                   CAMERA_TRANSITION_TYPE_MEDIUM);
      CutActionMoveToLocation(6.2, oMeph, lMephMove, FALSE);

      //CutActionStartConversation(6.5, oDurnan, oDurnan, "h9_durnan");
      CutPlaySound(6.5, oDurnan, "vs_nx2durnm_58");
      CutPlayAnimation(9.5, oMeph, ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 3.0);
      CutPlayAnimation(10.5, oMeph, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 3.0);
      CutApplyEffectToObject(11.4, DURATION_TYPE_TEMPORARY, VFX_DUR_GLOW_ORANGE, oMeph, 3.0);
      CutPlayAnimation(11.5, oMeph, ANIMATION_FIREFORGET_TAUNT, 3.0);
      //CutActionCastSpellAtObject(12.0, 793, oPCCopy, oInvis, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, FALSE);

      CutSetFacingPoint(11.0, oDurnan, "hx_meph");
      CutSetFacingPoint(11.3, oPCCopy, "hx_meph");

      CutApplyEffectAtLocation(13.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_SPELL_MANTLE_USE, GetLocation(oDurnan));
      //CutApplyEffectAtLocation(13.2, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SUMMON_UNDEAD, GetLocation(oDurnan));
      // Durnan gets teleported out.
      CutActionStartConversation(10.5, oDurnan, oDurnan, "h9_durnan");
      CutActionCastFakeSpellAtObject(10.7, SPELL_DISPEL_MAGIC, oCaster, oDurnan);

      CutClearAllActions(13.2, oDurnan, TRUE);
      CutJumpToLocation(13.4, oDurnan, lDurnan);
      CutApplyEffectToObject(13.7, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oDurnan);
      CutDestroyObject(13.8, oDurnan);
      CutActionCastFakeSpellAtObject(13.2, 793, oPCCopy, oInvis);
      CutJumpToLocation(15.5, oPCCopy, lGrapple);
      CutApplyEffectToObject(15.4, DURATION_TYPE_INSTANT, 475, oInvis);
      CutJumpToLocation(15.2, oPC, lPCMove3);
      CutSetCamera(15.2, oPC, CAMERA_MODE_TOP_DOWN, 20.0, 20.0, 60.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      DelayCommand(12.5, MakeLava(iCut, oMeph));
      DelayCommand(12.8, AssignCommand(GetModule(), KillEveryone(iCut, oMeph, oPCCopy, oPC, oDurnan)));
      DelayCommand(13.0, KillRing(iCut, oPC));
      CutSetFacingPoint(17.0, oMeph, "HX_PC_COPY_FINAL");
      DelayCommand(18.0, ClearLava(iCut, oMeph));
      CutSetFacingPoint(19.0, oPC, "hx_meph");

      CutActionCastFakeSpellAtLocation(19.5, SPELL_WEIRD, oMeph, lPCMove3);
      CutApplyEffectAtLocation(21.7, oPC, DURATION_TYPE_INSTANT, VFX_FNF_LOS_EVIL_20, lPCMove3);
      CutApplyEffectAtLocation(21.7, oPC, DURATION_TYPE_INSTANT, VFX_FNF_LOS_EVIL_20, lGrapple);
      CutApplyEffectAtLocation(21.8, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HARM, lGrapple);
      CutApplyEffectToObject(22.5, DURATION_TYPE_INSTANT, VFX_DUR_CUTSCENE_INVISIBILITY, oPCCopy);
      DelayCommand(22.4, RestorePCAppearance(oPC, iCut));
      CutRemoveEffects(22.5, oPC);
      CutApplyEffectAtLocation(22.1, oPC, DURATION_TYPE_INSTANT, VFX_IMP_HARM, lPCMove3);
      CutSetCamera(22.6, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 6.0, 90.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutActionStartConversation(23.0, oMeph, oPC, "h9_mephistophele");

      // End scene.
      //CutFadeOutAndIn(40.5, oPC, 1.5);
      //CutDisableCutscene(iCut, 41.0, 41.0, RESTORE_TYPE_NONE);
}

void SetMusic(int iCut, object oPC)
{
    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        object oArea = GetArea(oPC);
        int iTrack = MusicBackgroundGetNightTrack(oArea);
        MusicBackgroundStop(oArea);
        MusicBackgroundChangeDay(oArea, iTrack);
        MusicBackgroundPlay(oArea);
    }
}

void DoDayToNight(int iCut, object oPC, float fTime = 14.0)
{
     if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
     {
        DayToNight(oPC, fTime);
     }
}

// Play sound object.
void CutPlaySoundObject(int iCut, object oSound)
{
    if(iCut == GetLocalInt(oSound, "nCutsceneNumber"))
    {
       SoundObjectPlay(oSound);
    }
}

// Create fire trail.
void CutCreateFire(int iCut, object oPC)
{
    int x = 1;
    object oWP = GetNearestObjectByTag("hx_crsytal_cut_fire", oPC, x);
    float fDelay = 0.0;

    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
       while(GetIsObjectValid(oWP))
       {
           DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), GetLocation(oWP)));
           fDelay = fDelay + 0.13;
           x = x + 1;
           oWP = GetNearestObjectByTag("hx_crsytal_cut_fire", oPC, x);
       }
    }
}

// Create corpse fire.
void CutMakeCorpseFire(int iCut, object oDead)
{
    if(iCut == GetLocalInt(oDead, "nCutsceneNumber"))
    {
       CreateObject(OBJECT_TYPE_PLACEABLE, "hx_crystal_fire", GetLocation(oDead));
    }
}

// Make Meph appear.
void RevealMeph(int iCut, object oMeph)
{
    effect eEffect = GetFirstEffect(oMeph);

    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        while(GetIsEffectValid(eEffect))
        {
            RemoveEffect(oMeph, eEffect);
            eEffect = GetNextEffect(oMeph);
        }
    }
}

// Make Meph appear.
void DestroyBuilding(int iCut, object oMeph)
{
    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        object oSafety = GetObjectByTag("hx_invis_safety");
        object oBuilding = GetNearestObjectByTag("hx_meph_building", oMeph);

        int iVFX = StringToInt(GetStringRight(GetName(oBuilding), 3));
        effect eEffect = GetFirstEffect(oBuilding);

        DestroyObject(oSafety);

        while(GetIsEffectValid(eEffect))
        {
            RemoveEffect(oBuilding, eEffect);
            eEffect = GetNextEffect(oBuilding);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iVFX), oBuilding);

        object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_meph_dest_fin", GetLocation(oBuilding));

        // Apply the destroyed effect to the new object. Make self invis.
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iVFX), oNew);
        DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oBuilding));
        DestroyObject(oBuilding, 6.5);
    }
}

// Blow up the building.
void ExplodeBuilding(int iCut, object oMeph)
{
    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        object oBuilding = GetNearestObjectByTag("hx_meph_building", oMeph);
        location lLoc1 = GetLocation(GetNearestObjectByTag("hx_meph_explosion", oBuilding, 1));
        location lLoc2 = GetLocation(GetNearestObjectByTag("hx_meph_explosion", oBuilding, 2));

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oBuilding);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), oBuilding);

        DelayCommand(0.1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc1));
        DelayCommand(0.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), lLoc2));
        DelayCommand(0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc1));
        DelayCommand(0.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc2));
    }
}

// Fill area with lava.
void MakeLava(int iCut, object oMeph)
{
    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        object oSound = GetObjectByTag("hx_lava_sound");

        SoundObjectPlay(oSound);
        TLChangeAreaGroundTiles(GetArea(OBJECT_SELF), X2_TL_GROUNDTILE_LAVA, 8, 8, 1.3);
    }
}

// Clear area of lava.
void ClearLava(int iCut, object oMeph)
{
    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        object oSound = GetObjectByTag("hx_lava_sound");

        SoundObjectStop(oSound);
        CleanLava(oSound);
        DelayCommand(0.2, CleanLava(oSound));
    }
}

// Kill everyone but Meph and PC.
void KillEveryone(int iCut, object oMeph, object oCopy, object oPC, object oDurnan)
{
    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        location lMeph = GetLocation(oMeph);
        object oCreature = GetFirstObjectInShape(SHAPE_CUBE, 100.0, lMeph, FALSE, OBJECT_TYPE_CREATURE);
        float fDelay = 0.0;

        while(GetIsObjectValid(oCreature))
        {
            if(GetIsPC(oCreature) || oCreature == oMeph || GetMaster(oCreature) == oPC)
            {
                ;
            }
            else if(oCreature == oCopy)
            {
                //DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oCreature));
                ;
            }
            else if(oCreature == oDurnan)
            {
                //SetImmortal(oCreature, FALSE);
                ;
            }
            else
            {
                if(GetImmortal(oCreature))
                {
                    SetImmortal(oCreature, FALSE);
                }
                  // Debug
                  // DelayCommand(fDelay, AssignCommand(oCreature, SpeakString("OUCH!")));
                DelayCommand(fDelay, DelayCreate(iCut, oMeph, OBJECT_TYPE_PLACEABLE, "hx_end_flames", GetLocation(oCreature)));
                //DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oCreature));
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oCreature));
            }
            fDelay = fDelay + 0.08;
            oCreature = GetNextObjectInShape(SHAPE_CUBE, 100.0, lMeph, FALSE, OBJECT_TYPE_CREATURE);
        }
    }
}

// DelayCreate.
void DelayCreate(int iCut, object oMeph, int iType, string sRes, location lLoc)
{
    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        CreateObject(iType, sRes, lLoc);
    }
}

void KillRing(int iCut, object oPC)
{
    int z = 0;
    object oWizRing = GetObjectByTag("hx_end_battle_protect", z);

    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        while(GetIsObjectValid(oWizRing))
        {
            // Apply the ring effect.
            DestroyObject(oWizRing);
            z = z + 1;
            oWizRing = GetObjectByTag("hx_end_battle_protect", z);
        }
    }
}

void RestorePCAppearance(object oPC, int iCut)
{
    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        CutRestorePCAppearance(iCut, oPC);
    }
}
