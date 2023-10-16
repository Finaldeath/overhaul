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
// Grab the PC's armor.
void StealArmor(object oPC, object oMimic);

void main()
{
    object oPC = GetEnteringObject();
    object oTile;
    int iCut = 55;

    // * flood area with tiles
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        int nColumns = 8;
        int nRows = 13;

        TLChangeAreaGroundTiles(OBJECT_SELF, X2_TL_GROUNDTILE_ICE, nColumns, nRows);

        // Apply effects to the levers.
        int x = 0;
        object oInvis = GetObjectByTag("h4b_invis_lever", x);

        while(GetIsObjectValid(oInvis))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_SPELLTURNING), oInvis);
            x = x + 1;
            oInvis = GetObjectByTag("h4b_invis_lever", x);
        }
        StartCutscene(oPC, iCut);
    }
    //"Ring effect" check
    HXAreaEnter(oPC);
}

void StartCutscene(object oPC, int iCut)
{
      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);

      // The player will have the ring on. Find which slot it is in.
      object oRing;
      object oTempRing1 = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
      object oTempRing2 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

      if(GetTag(oTempRing1) == "hx_puzzle_ring")
          oRing = oTempRing1;
      else
          oRing = oTempRing2;
      CutSetActiveCutsceneForObject(oRing, iCut);

      // Cutscene objects other than the PC.
      object oMimic = GetObjectByTag("hx_mimic");
      CutSetActiveCutsceneForObject(oMimic, iCut);
      object oWP = GetObjectByTag("h4a_cut_move1");
      CutSetActiveCutsceneForObject(oWP, iCut);
      object oCaster = GetObjectByTag("h4a_caster");
      CutSetActiveCutsceneForObject(oCaster, iCut);
      object oGrapple = GetObjectByTag("h4a_cut_grapple");
      CutSetActiveCutsceneForObject(oGrapple, iCut);

      // Setup the cutscene. Destroy the trigger now. Adjust the camera.
      CutBlackScreen(0.0, oPC);
      CutSetCutsceneMode(0.1, oPC, TRUE, FALSE);
      CutSetCamera(0.1, oPC, CAMERA_MODE_STIFF_CHASE_CAMERA, 70.0, 10.0, 40.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);


      // Start the scene.
      CutSetCamera(3.5, oPC, CAMERA_MODE_STIFF_CHASE_CAMERA, 110.0, 6.0, 40.0,
                   CAMERA_TRANSITION_TYPE_SLOW);
      CutPlayAnimation(5.5, oPC, ANIMATION_LOOPING_GET_MID, 1.0);
      CutActionUnequipItem(6.0, oPC, oRing);
      CutPlayAnimation(6.0, oMimic, ANIMATION_LOOPING_SPASM, 0.0);

      CutPlayAnimation(8.0, oMimic, ANIMATION_LOOPING_CONJURE1, 1.9);
      DelayCommand(8.0, StealArmor(oPC, oMimic));
      CutActionCastFakeSpellAtObject(8.5, 729, oCaster, oMimic, PROJECTILE_PATH_TYPE_BALLISTIC);
      CutApplyEffectToObject(9.9, DURATION_TYPE_INSTANT, VFX_COM_BLOOD_SPARK_LARGE, oMimic);
      CutPlayAnimation(8.6, oPC, ANIMATION_FIREFORGET_SPASM, 3.0);
      CutPlaySound(10.5, oMimic, "as_pl_belchingm1");
      CutPlayAnimation(10.6, oMimic, ANIMATION_LOOPING_CONJURE1, 1.0);
      CutPlayAnimation(10.7, oPC, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
      CutActionMoveToObject(13.8, oPC, oWP, TRUE);
      CutSetFacingPoint(12.0, oMimic, "h4a_cut_grapple");
      CutPlayAnimation(13.0, oMimic, ANIMATION_LOOPING_CONJURE1, 1.9);
      CutApplyEffectToObject2(13.5, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE_LASH, oMimic, BODY_NODE_HAND), oGrapple, 2.0);
      CutSetCamera(15.0, oPC, CAMERA_MODE_STIFF_CHASE_CAMERA, 200.0, 6.0, 40.0,
                   CAMERA_TRANSITION_TYPE_VERY_FAST);
      CutJumpToObject(15.5, oMimic, oGrapple);
      CutClearAllActions(15.6, oPC, TRUE);
      CutSetFacingPoint(15.8, oPC, "h4a_cut_grapple");
      DelayCommand(15.9, SetMimicAI(oMimic));
      CutPlayAnimation(17.7, oPC, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
      // End scene.
      CutFadeOutAndIn(23.0, oPC, 1.5);
      CutDisableCutscene(iCut, 24.0, 24.0, RESTORE_TYPE_NONE);

}

// Grab the PC's armor.
void StealArmor(object oPC, object oMimic)
{
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    object oItem = GetFirstItemInInventory(oPC);
    object oBestArmor = OBJECT_INVALID;

    if(GetIsObjectValid(oArmor))
    {
        CopyItem(oArmor, oMimic);
        DestroyObject(oArmor);
        return;
    }
    else
    {
        while(GetIsObjectValid(oItem))
        {
            if(GetBaseItemType(oItem) == BASE_ITEM_ARMOR)
            {
                if(!GetIsObjectValid(oBestArmor))
                {
                    oBestArmor = oItem;
                }
                if(GetGoldPieceValue(oItem) > GetGoldPieceValue(oBestArmor))
                {
                    oBestArmor = oItem;
                }
            }
            oItem = GetNextItemInInventory(oPC);
        }
    }
    if(GetIsObjectValid(oBestArmor))
    {
        CopyItem(oBestArmor, oMimic);
        DestroyObject(oBestArmor);
    }
}
