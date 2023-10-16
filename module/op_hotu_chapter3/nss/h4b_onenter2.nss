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
// Pick the cutscene outcome.
void DetermineOutcome(object oPC, object oMimic, object oCaster, object oWP, object oGrapple, int iCut);
// Sound for bad outcome.
void PlayFistSound();
// Block the PC from moving around pillars.
void BlockPC();
// Activate cutscene for Associates.
void ActivateAssociates(object oObject, int iCut);
// Clear effects.
void ClearAllEffects();
// Clear all the player's associates.
void ClearParty(object oObject, int iCut);

void main()
{
    object oPC = GetEnteringObject();
    object oTile;
    int iCut = 55;

    // * flood area with tiles
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        //DoSinglePlayerAutoSave();

        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        BlackScreen(oPC);

        int nColumns = 8;
        int nRows = 13;

        BlockPC();
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
        DelayCommand(1.0, StartCutscene(oPC, iCut));
    }
    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}

void StartCutscene(object oPC, int iCut)
{
      // Reset the broken cutscene.
      SetLocalInt(oPC, "HX_Trying_To_Break", 0);

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);

      // The player will have the ring on. Find which slot it is in.
      object oRing;
      object oCaster;
      object oTempRing1 = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
      object oTempRing2 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

      if(GetTag(oTempRing1) == "hx_puzzle_ring")
          oRing = oTempRing1;
      else
          oRing = oTempRing2;
      CutSetActiveCutsceneForObject(oRing, iCut);

      if(GetCreatureSize(oPC) == CREATURE_SIZE_SMALL || GetCreatureSize(oPC) == CREATURE_SIZE_TINY)
          oCaster = GetObjectByTag("h4a_caster2");
      else
          oCaster = GetObjectByTag("h4a_caster");
      CutSetActiveCutsceneForObject(oCaster, iCut);

      // Cutscene objects other than the PC.
      object oMimic = GetObjectByTag("hx_mimic");
      CutSetActiveCutsceneForObject(oMimic, iCut);
      object oWP = GetObjectByTag("h4a_cut_move1");
      CutSetActiveCutsceneForObject(oWP, iCut);
      object oGrapple = GetObjectByTag("h4a_cut_grapple");
      CutSetActiveCutsceneForObject(oGrapple, iCut);

      // Setup the cutscene. Destroy the trigger now. Adjust the camera.
      //CutBlackScreen(0.0, oPC);
      CutSetCutsceneMode(0.1, oPC, TRUE, FALSE, TRUE, TRUE);
      DelayCommand(0.2, ActivateAssociates(oPC, iCut));
      CutSetCamera(0.4, oPC, CAMERA_MODE_TOP_DOWN, 70.0, 10.0, 60.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(0.7, oPC, GetLocation(GetNearestObjectByTag("h4a_portal_in_wp", oPC)));
      CutJumpToLocation(2.0, oPC, GetLocation(GetNearestObjectByTag("h4a_portal_in_wp", oPC)));

      CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);


      // Start the scene.
      CutSetCamera(3.5, oPC, CAMERA_MODE_TOP_DOWN, 110.0, 6.0, 60.0,
                   CAMERA_TRANSITION_TYPE_SLOW);
      CutPlayAnimation(5.5, oPC, ANIMATION_LOOPING_GET_MID, 1.0);
      CutActionUnequipItem(6.0, oPC, oRing);
      CutPlayAnimation(6.0, oMimic, ANIMATION_LOOPING_SPASM, 0.0);

      CutPlayAnimation(8.0, oMimic, ANIMATION_LOOPING_CONJURE1, 1.9);
      DelayCommand(8.0, StealArmor(oPC, oMimic));
      DelayCommand(8.2, DetermineOutcome(oPC, oMimic, oCaster, oWP, oGrapple, iCut));
}

// Grab the PC's armor.
void StealArmor(object oPC, object oMimic)
{
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    object oItem = GetFirstItemInInventory(oPC);
    object oBestArmor = OBJECT_INVALID;
    object oArmorStorage = GetObjectByTag("h4c_gem_controller");

    if(GetIsObjectValid(oArmor))
    {
        CopyItem(oArmor, oArmorStorage);
        DestroyObject(oArmor);
        SetLocalInt(OBJECT_SELF, "HX_MIMIC_JOURNAL_STATE", 10);
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
        CopyItem(oBestArmor, oArmorStorage);
        DestroyObject(oBestArmor);
        SetLocalInt(OBJECT_SELF, "HX_MIMIC_JOURNAL_STATE", 20);
    }
    else
    {
        oItem = GetFirstItemInInventory(oPC);
        while(GetIsObjectValid(oItem))
        {

            if(!GetIsObjectValid(oBestArmor) && GetTag(oItem) != "hx_puzzle_ring")
            {
                oBestArmor = oItem;
            }
            if(GetGoldPieceValue(oItem) > GetGoldPieceValue(oBestArmor) && GetTag(oItem) != "hx_puzzle_ring")
            {
                oBestArmor = oItem;
            }
            oItem = GetNextItemInInventory(oPC);
        }
        if(oBestArmor == OBJECT_INVALID)
        {
            SetLocalInt(oPC, "HX_Trying_To_Break", 1);
        }
        else
        {
            SetLocalInt(OBJECT_SELF, "HX_MIMIC_JOURNAL_STATE", 30);
        }
    }
}

void DetermineOutcome(object oPC, object oMimic, object oCaster, object oWP, object oGrapple, int iCut)
{
      int iState = GetLocalInt(OBJECT_SELF, "HX_MIMIC_JOURNAL_STATE");

      if(GetLocalInt(oPC, "HX_Trying_To_Break") == 0)
      {
          CutActionCastFakeSpellAtObject(0.3, 729, oCaster, oMimic, PROJECTILE_PATH_TYPE_BALLISTIC);
          CutApplyEffectToObject(1.7, DURATION_TYPE_INSTANT, VFX_COM_BLOOD_SPARK_LARGE, oMimic);
          CutPlayAnimation(0.5, oPC, ANIMATION_FIREFORGET_SPASM, 3.0);
          CutPlaySound(2.3, oMimic, "as_pl_belchingm1");
          CutPlayAnimation(2.4, oMimic, ANIMATION_LOOPING_CONJURE1, 1.0);
          CutPlayVoiceChat(2.45, oPC, VOICE_CHAT_BATTLECRY1);
          CutPlayAnimation(2.5, oPC, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
          CutActionMoveToObject(5.6, oPC, oWP, TRUE);
          CutSetFacingPoint(3.8, oMimic, "h4a_cut_grapple");
          //CutPlayAnimation(4.8, oMimic, ANIMATION_LOOPING_CONJURE1, 1.9);
         //CutApplyEffectToObject2(5.3, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE_LASH, oMimic, BODY_NODE_HAND), oGrapple, 2.0);
          DelayCommand(4.8, AssignCommand(oMimic, ActionCastSpellAtObject(793, oGrapple, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT)));
          CutSetCamera(5.9, oPC, CAMERA_MODE_TOP_DOWN, 200.0, 4.0, 70.0,
                       CAMERA_TRANSITION_TYPE_VERY_FAST);
          CutJumpToObject(7.3, oMimic, oGrapple);
          CutClearAllActions(7.4, oPC, TRUE);
          CutSetFacingPoint(7.6, oPC, "h4a_cut_grapple");
          DelayCommand(7.7, SetMimicAI(oMimic));
          CutPlayVoiceChat(9.45, oPC, VOICE_CHAT_CUSS);
          CutPlayAnimation(9.5, oPC, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
          // End scene.
          CutFadeOutAndIn(14.8, oPC, 1.5);
          AddJournalQuestEntry("hx_mimic_journ", iState, oPC, TRUE, TRUE);
            //Give non-repeatable XP
            int i2daRow;
            if (iState == 10)
            {
                i2daRow = 112;
            }
            else if (iState == 20)
            {
                i2daRow = 113;
            }
            else if (iState == 30)
            {
                i2daRow = 114;
            }

            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                Reward_2daXP(oPC, i2daRow);
            }

          DelayCommand(15.5, ClearParty(oPC, iCut));
          CutDisableCutscene(iCut, 15.8, 15.8, RESTORE_TYPE_NONE);
      }
      else
      {
          CutApplyEffectToObject(0.3, DURATION_TYPE_TEMPORARY, VFX_DUR_BIGBYS_CLENCHED_FIST, oPC, 9.5);
          DelayCommand(1.6, PlayFistSound());
          CutApplyEffectToObject(1.7, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          CutPlayVoiceChat(1.8, oPC, VOICE_CHAT_PAIN1);
          CutPlayAnimation(1.7, oPC, ANIMATION_LOOPING_SPASM, 10.0);
          //CutActionCastSpellAtObject(3.3, SPELL_BIGBYS_CRUSHING_HAND, oMimic, oPC, METAMAGIC_ANY, TRUE);
          DelayCommand(2.6, PlayFistSound());
          CutApplyEffectToObject(2.7, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          CutPlayVoiceChat(2.8, oPC, VOICE_CHAT_PAIN3);
          //CutActionCastSpellAtObject(7.3, SPELL_BIGBYS_CRUSHING_HAND, oMimic, oPC, METAMAGIC_ANY, TRUE);
          DelayCommand(3.6, PlayFistSound());
          CutApplyEffectToObject(3.7, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          CutPlayVoiceChat(3.8, oPC, VOICE_CHAT_PAIN2);
          DelayCommand(4.6, PlayFistSound());
          CutApplyEffectToObject(4.7, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          CutPlayVoiceChat(4.8, oPC, VOICE_CHAT_PAIN3);
          DelayCommand(5.6, PlayFistSound());
          CutApplyEffectToObject(5.7, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          CutPlayVoiceChat(5.8, oPC, VOICE_CHAT_PAIN2);
          DelayCommand(6.6, PlayFistSound());
          CutApplyEffectToObject(6.7, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          CutPlayVoiceChat(6.8, oPC, VOICE_CHAT_PAIN1);
          DelayCommand(7.6, PlayFistSound());
          CutApplyEffectToObject(7.7, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          CutPlayVoiceChat(7.8, oPC, VOICE_CHAT_PAIN3);
          DelayCommand(8.6, PlayFistSound());
          CutApplyEffectToObject(8.7, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          CutPlayVoiceChat(8.8, oPC, VOICE_CHAT_PAIN1);
          DelayCommand(9.6, PlayFistSound());
          CutApplyEffectToObject(9.5, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oPC);
          //CutPlayVoiceChat(9.6, oPC, VOICE_CHAT_PAIN2);
          CutSetPlotFlag(9.5, oPC, FALSE);
          CutDeath(9.6, oPC, FALSE);
          DelayCommand(9.8, SetLocalInt(oPC, "HX_Trying_To_Break", 0));
          DelayCommand(9.9, SetMimicAI(oMimic));
          DelayCommand(9.9, ClearParty(oPC, iCut));
          CutDisableCutscene(iCut, 10.0, 10.0, RESTORE_TYPE_NONE);
      }
}

void PlayFistSound()
{
    object oSound = GetObjectByTag("h4b_fist");

    SoundObjectPlay(oSound);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oSound);
    DelayCommand(0.8, SoundObjectStop(oSound));
}

void BlockPC()
{
    int x = 0;
    object oBlock = GetObjectByTag("hx_pc_blocker_mimic", x);

    while(GetIsObjectValid(oBlock))
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oBlock);
        x = x + 1;
        oBlock = GetObjectByTag("hx_pc_blocker_mimic", x);
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

// Clear all the player's associates.
void ClearParty(object oObject, int iCut)
{
    if(iCut == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        object oHench1 = GetHenchman(oObject, 1);
        object oHench2 = GetHenchman(oObject, 2);
        object oHench3 = GetHenchman(oObject, 3);
        object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
        object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
        object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
        object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

        if(GetIsObjectValid(oHench1))
        {
            AssignCommand(oHench1, ClearAllEffects());
            //DelayCommand(0.2, AssignCommand(oHench1, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oHench2))
        {
            AssignCommand(oHench2, ClearAllEffects());
            //DelayCommand(0.2, AssignCommand(oHench2, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oHench3))
        {
            AssignCommand(oHench3, ClearAllEffects());
            //DelayCommand(0.2, AssignCommand(oHench3, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oAssoc1))
        {
            AssignCommand(oAssoc1, ClearAllEffects());
            //DelayCommand(0.2, AssignCommand(oAssoc1, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oAssoc2))
        {
            AssignCommand(oAssoc2, ClearAllEffects());
            //DelayCommand(0.2, AssignCommand(oAssoc2, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oAssoc3))
        {
            AssignCommand(oAssoc3, ClearAllEffects());
           // DelayCommand(0.2, AssignCommand(oAssoc3, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oAssoc4))
        {
            AssignCommand(oAssoc4, ClearAllEffects());
            //DelayCommand(0.2, AssignCommand(oAssoc4, ActionJumpToLocation(lLoc)));
        }
    }
}

void ClearAllEffects()
{
    effect eEffect = GetFirstEffect(OBJECT_SELF);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(OBJECT_SELF, eEffect);
        eEffect = GetNextEffect(OBJECT_SELF);
    }
}
