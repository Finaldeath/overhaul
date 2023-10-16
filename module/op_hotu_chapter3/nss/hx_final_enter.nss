//::///////////////////////////////////////////////
//:: Name hx_final_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will spawn in any destructible buildings
    for the ending.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 5, 2003
//:://////////////////////////////////////////////
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
// Activate cutscene for Associates.
void ActivateAssociates(object oObject, int iCut);

void main()
{
    int x = 0;
    int y = 0;
    int z = 0;
    object oPC = GetEnteringObject();
    object oBuild = GetObjectByTag("hx_meph_building", x);
    int iVFX;
    object oInvis = GetObjectByTag("hx_mephdstry_obj", y);
    int iCut = 300;
    object oWizRing = GetObjectByTag("hx_end_battle_protect", z);

    if(GetIsPC(oPC))
    {
        //Get the difficulty when you enter the area
        SetLocalInt(GetModule(), "ach_meph_difficulty", GetGameDifficulty());

        if(GetLocalInt(GetModule(), "X2_MEPH_IS_DEAD") == 1)
        {
            ExecuteScript("hx_the_end", oPC);
            return;
        }
        // Do once
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
                // Debug
                /////////
                //SetLocalInt(GetModule(), "bKnower_MephistophelesNamed", TRUE);
            AddJournalQuestEntry("hx_crystal_journ", 40, oPC, TRUE, TRUE);
            BlackScreen(oPC);
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
            // Set the PC unsafe from lava.
            SetLavaUnsafe(oPC);
            // Spawn the visual effect buildings in.
            while(GetIsObjectValid(oBuild))
            {
                // Get the effect.
                iVFX = StringToInt(GetStringLeft(GetName(oBuild), 3));
                // Apply the building effect.
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iVFX), oBuild);
                x = x + 1;
                oBuild = GetObjectByTag("hx_meph_building", x);
            }

            // Make the building PC Blockers invis.
            while(GetIsObjectValid(oInvis))
            {
                // Apply the invis effect.
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oInvis);
                y = y + 1;
                oInvis = GetObjectByTag("hx_mephdstry_obj", y);
            }

            // Make wizard ring.
            while(GetIsObjectValid(oWizRing))
            {
                // Apply the ring effect.
                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(497), oWizRing);
                z = z + 1;
                oWizRing = GetObjectByTag("hx_end_battle_protect", z);
            }
        StartCutscene(oPC, iCut);
        }
    }
}

void StartCutscene(object oPC, int iCut)
{
      location lLoc = GetLocation(GetObjectByTag("hx_end_battle_copy_spawn_wp"));

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

      // Cutscene objects other than the PC.
      object oMeph = GetNearestObjectByTag("hx_meph", oPC);
      CutSetActiveCutsceneForObject(oMeph, iCut);
      object oMeph2 = GetNearestObjectByTag("hx_meph_crystalx", oPC);
      CutSetActiveCutsceneForObject(oMeph2, iCut);
      object oDurnan = GetNearestObjectByTag("hx_end_fight_durnan", oPC);
      CutSetActiveCutsceneForObject(oDurnan, iCut);

      // PC Copy.
      object oPCCopy = CutCreatePCCopy(oPC, lLoc, "HX_PC_COPY_FINAL");
      CutSetActiveCutsceneForObject(oPCCopy, iCut);

      object oSound = GetObjectByTag("hx_crystal_meph_sound1");
      CutSetActiveCutsceneForObject(oSound, iCut);
      object oSound2 = GetNearestObjectByTag("hx_crystal_fire_explode", oPC);
      CutSetActiveCutsceneForObject(oSound2, iCut);
      object oSound3 = GetNearestObjectByTag("hx_final_pc_appear", oPC);
      CutSetActiveCutsceneForObject(oSound3, iCut);
      object oSound4 = GetNearestObjectByTag("hx_final_meph_appear", oPC);
      CutSetActiveCutsceneForObject(oSound4, iCut);

      // Waypoints.
      location lPCCopyStart = GetLocation(GetNearestObjectByTag("hx_final_fight_pc_start", oPC));
      location lPCStart = GetLocation(GetNearestObjectByTag("hx_end_battle_pc_start_wp", oPC));
      location lPCMove1 = GetLocation(GetNearestObjectByTag("hx_end_battle_pc_move1_wp", oPC));
      location lMephStart = GetLocation(GetNearestObjectByTag("hx_crystal2_meph_end_wp", oPC));

      // Deal with Henchmen.
      ActivateAssociates(oPC, iCut);

      // Setup the cutscene.
      CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH, TRUE);
      //CutSetCutsceneMode(1.1, oPC, TRUE, TRUE, TRUE, 2);

      CutSetCamera(3.4, oPC, CAMERA_MODE_TOP_DOWN, 130.0, 5.0, 85.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(2.0, oPC, lPCStart);

      // Cached Meph
      CutApplyEffectToObject(0.6, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oMeph);

      CutFadeFromBlack(3.5, oPC, FADE_SPEED_MEDIUM);

      // Start the scene.
      CutSetCamera(11.0, oPC, CAMERA_MODE_TOP_DOWN, 120.0, 18.0, 78.0,
                   CAMERA_TRANSITION_TYPE_SLOW);

      CutPlayAnimation(20.0, oDurnan, ANIMATION_LOOPING_TALK_FORCEFUL, 5.0);

      // PC warps in.
      DelayCommand(24.1, CutPlaySoundObject(iCut, oSound3));
      CutApplyEffectAtLocation(24.2, oPC, DURATION_TYPE_INSTANT, 487, lPCCopyStart);
      CutJumpToLocation(25.5, oPCCopy, lPCCopyStart);
      CutSetCamera(25.0, oPC, CAMERA_MODE_TOP_DOWN, 110.0, 6.0, 80.0,
                   CAMERA_TRANSITION_TYPE_FAST);
      CutActionMoveToLocation(24.0, oPC, lPCMove1, FALSE);

      // Durnan starts conversation.
      CutSetFacingPoint(26.1, oDurnan, "HX_PC_COPY_FINAL");
      CutActionStartConversation(28.0, oDurnan, oPC, "h9_durnan");

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

// Activate cutscene for Associates.
void ActivateAssociates(object oObject, int iCut)
{
    //if(iCut == GetLocalInt(oObject, "nCutsceneNumber"))
    //{
        object oHench1 = GetHenchman(oObject, 1);
        object oHench2 = GetHenchman(oObject, 2);
        object oHench3 = GetHenchman(oObject, 3);
        object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
        object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
        object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
        object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

        if(GetIsObjectValid(oHench1))
        {
            CutSetActiveCutsceneForObject(oHench1, iCut);
            CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oHench1);
            CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oHench1);
        }
        if(GetIsObjectValid(oHench2))
        {
            CutSetActiveCutsceneForObject(oHench2, iCut);
            CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oHench2);
            CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oHench2);
        }
        if(GetIsObjectValid(oHench3))
        {
            CutSetActiveCutsceneForObject(oHench3, iCut);
            CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oHench3);
            CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oHench3);
        }
        if(GetIsObjectValid(oAssoc1))
        {
            CutSetActiveCutsceneForObject(oAssoc1, iCut);
            CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oAssoc1);
            CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oAssoc1);
        }
        if(GetIsObjectValid(oAssoc2))
        {
            CutSetActiveCutsceneForObject(oAssoc2, iCut);
            CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oAssoc2);
            CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oAssoc2);
        }
        if(GetIsObjectValid(oAssoc3))
        {
            CutSetActiveCutsceneForObject(oAssoc3, iCut);
            CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oAssoc3);
            CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oAssoc3);
        }
        if(GetIsObjectValid(oAssoc4))
        {
            CutSetActiveCutsceneForObject(oAssoc4, iCut);
            CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oAssoc4);
            CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oAssoc4);
        }
    //}
}

