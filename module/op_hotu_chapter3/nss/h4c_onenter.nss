//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the generic onenter script for "ring
     vision" areas.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
#include "x2_inc_toollib"
#include "x2_inc_cutscene"
#include "mimic_inc"
void StartCutscene(object oPC, int iCut);

void main()
{
    object oPC = GetEnteringObject();
    object oTile;
    int iCut = 65;

    int x = 0;
    object oInvis = GetObjectByTag("hx_mimic_center", x);

    // Demon fix if you abort the dialog.
    if(GetIsPC(oPC))
    {
        object oDemon = GetObjectByTag("hx_hand_demon");
        int iConv = GetLocalInt(GetModule(), "HX_DEMON_ABORTED");

        if(iConv == TRUE)
        {
            SetLocalInt(GetModule(), "HX_DEMON_ABORTED", FALSE);

            if(!GetIsObjectValid(oDemon))
            {
                oDemon = CreateObject(OBJECT_TYPE_CREATURE, "hx_hand_demon", GetLocation(oPC));
            }
            DelayCommand(2.0, ChangeToStandardFaction(oDemon, STANDARD_FACTION_HOSTILE));
            DelayCommand(2.5, AssignCommand(oDemon, ActionAttack(oPC)));
        }
    }

    // * flood area with tiles
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        int nColumns = 12;
        int nRows = 12;

        TLChangeAreaGroundTiles(OBJECT_SELF, X2_TL_GROUNDTILE_ICE, nColumns, nRows);

        // Apply effect for Mimic center.
        while(GetIsObjectValid(oInvis))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_AURA_FIRE), oInvis);
            x = x + 1;
            oInvis = GetObjectByTag("hx_mimic_center", x);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELLTURNING), GetObjectByTag("h4c_conduc_lever"));
        // Debug.
        //SendMessageToPC(GetFirstPC(), "[NOT IN STRING EDITOR] GLOW EFFECT APPLIED");
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 1.1);
        CutDisableCutscene(60, 0.0, 0.0, RESTORE_TYPE_NONE);
        DelayCommand(1.0, StartCutscene(oPC, iCut));
    }
    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}

void StartCutscene(object oPC, int iCut)
{


      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);

      // The player may have the ring on. Find which slot it is in.
      object oRing;
      object oTempRing1 = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
      object oTempRing2 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

      if(GetTag(oTempRing1) == "hx_puzzle_ring")
          oRing = oTempRing1;
      else if(GetTag(oTempRing2) == "hx_puzzle_ring")
          oRing = oTempRing2;
      CutSetActiveCutsceneForObject(oRing, iCut);

      // Cutscene objects other than the PC.
      object oMimic = GetObjectByTag("hx_mimic");
      CutSetActiveCutsceneForObject(oMimic, iCut);
      object oWP = GetObjectByTag("h4b_cut2_end_mimic_wp2");
      CutSetActiveCutsceneForObject(oWP, iCut);
      object oThrower = GetObjectByTag("h4c_gem_thrower3");
      CutSetActiveCutsceneForObject(oThrower, iCut);
      object oGrapple = GetObjectByTag("h4a_cut_grapplex");
      CutSetActiveCutsceneForObject(oGrapple, iCut);

      // Setup the cutscene. Destroy the trigger now. Adjust the camera.
      //CutBlackScreen(0.0, oPC);
      CutSetCutsceneMode(0.1, oPC, TRUE, FALSE, TRUE, 2);
      CutSetCamera(0.3, oPC, CAMERA_MODE_TOP_DOWN, 300.0, 7.0, 55.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);


      // Start the scene.
      CutSetCamera(2.5, oPC, CAMERA_MODE_TOP_DOWN, 280.0, 4.0, 70.0,
                   CAMERA_TRANSITION_TYPE_VERY_SLOW);
      if(GetTag(oRing) == "hx_puzzle_ring")
      {
          CutPlayAnimation(4.5, oPC, ANIMATION_LOOPING_GET_MID, 1.0);
          CutActionUnequipItem(5.0, oPC, oRing);
      }
      CutPlayAnimation(6.0, oMimic, ANIMATION_LOOPING_SPASM, 0.0);
      DelayCommand(7.0, SignalEvent(oThrower, EventUserDefined(7778)));
      //CutPlayAnimation(9.0, oPC, ANIMATION_LOOPING_LOOK_FAR, 3.0);

      //CutSpeakString(11.25, oMimic, "[NOT IN STRING EDITOR] Me go gem!");
      CutSpeakStringByStrRef(11.25, oMimic, 85500);
      CutPlaySound(11.3, oMimic, "c_goblin_slct");
      CutPlayAnimation(11.35, oMimic, ANIMATION_LOOPING_CONJURE1, 0.5);

      CutSetFacingPoint(12.8, oMimic, "h4a_cut_grapplex");
      //CutPlayAnimation(13.8, oMimic, ANIMATION_LOOPING_CONJURE1, 1.9);
      //CutApplyEffectToObject2(14.3, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE_LASH, oMimic, BODY_NODE_HAND), oGrapple, 2.0);
      DelayCommand(13.8, AssignCommand(oMimic, ActionCastSpellAtObject(793, oGrapple, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT)));
      CutActionMoveToObject(15.6, oPC, oWP, TRUE);
      CutSetCamera(15.8, oPC, CAMERA_MODE_TOP_DOWN, 310.0, 2.0, 70.0,
                   CAMERA_TRANSITION_TYPE_VERY_SLOW);
      CutJumpToObject(16.3, oMimic, oGrapple);
      CutClearAllActions(17.4, oPC, TRUE);
      CutSetFacingPoint(17.6, oPC, "h4a_cut_grapplex");

      // End scene.
      DelayCommand(18.0, SetMimicAI(oMimic));
      CutFadeOutAndIn(23.0, oPC, 1.5);
      CutDisableCutscene(iCut, 24.0, 24.0, RESTORE_TYPE_NONE);
      DelayCommand(25.0, SignalEvent(oMimic, EventUserDefined(7777)));
}
