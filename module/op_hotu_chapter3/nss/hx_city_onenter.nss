//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the first cutscene in the city showing
     a quick view of someone getting yoiked by Meph.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 9, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
#include "x2_inc_cutscene"
#include "nw_i0_plot"
void StartCutscene(object oPC, int iCut);
// Have others react around him.
void DoReactions(int iCut, object oSpirit1, object oSpirit2, object oSpirit3, object oSpirit4, object oPC);
// Clear effects.
void ClearAllEffects();
// Clear all the player's associates.
void ClearParty(object oObject, int iCut);
// Activate cutscene for Associates.
void ActivateAssociates(object oObject, int iCut);

void main()
{
    object oPC = GetEnteringObject();
    int iCut = 700;

    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));

    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

        // Berry flame VFX
        int x = 1;
        object oFlame = GetNearestObjectByTag("hx_bflame2", oPC, x);

        while(GetIsObjectValid(oFlame))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PIXIEDUST), oFlame);
            x = x + 1;
            oFlame = GetNearestObjectByTag("hx_bflame2", oPC, x);
        }
        BlackScreen(oPC);
        DelayCommand(1.0, StartCutscene(oPC, iCut));
    }
}

void StartCutscene(object oPC, int iCut)
{
      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      //CutDisableAbort(iCut);

      // Cutscene objects other than the PC.
      object oSpiritx = GetNearestObjectByTag("hx_spirit", oPC);
      CutSetActiveCutsceneForObject(oSpiritx, iCut);

      object oSpirit1 = GetNearestObjectByTag("H2_SpiritMale", oPC, 1);
      CutSetActiveCutsceneForObject(oSpirit1, iCut);
      object oSpirit2 = GetNearestObjectByTag("H2_SpiritMale", oPC, 2);
      CutSetActiveCutsceneForObject(oSpirit2, iCut);
      object oSpirit3 = GetNearestObjectByTag("H2_SpiritFemale", oPC, 1);
      CutSetActiveCutsceneForObject(oSpirit3, iCut);
      object oSpirit4 = GetNearestObjectByTag("H2_SpiritFemale", oPC, 2);
      CutSetActiveCutsceneForObject(oSpirit4, iCut);

      // Waypoints.
      location lPCStart = GetLocation(GetNearestObjectByTag("hx_cut700_pc_start_wp", oPC));
      location lMove = GetLocation(GetNearestObjectByTag("hx_cut700_spirit_move_wp", oPC));

      // Setup the cutscene.
      DelayCommand(0.6, ActivateAssociates(oPC, iCut));
      CutSetCutsceneMode(1.1, oPC, TRUE, TRUE, TRUE);
      CutSetLocation(1.3, oPC);
      CutSetCamera(1.7, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 6.0, 75.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(1.5, oPC, lPCStart);
      CutFadeFromBlack(2.0, oPC, FADE_SPEED_FAST);

      // Start the scene.
      CutSetCamera(2.5, oPC, CAMERA_MODE_TOP_DOWN, 310.0, 1.0, 85.0,
                   CAMERA_TRANSITION_TYPE_VERY_SLOW);

      CutActionMoveToLocation(1.0, oSpiritx, lMove, FALSE);
      CutApplyEffectAtLocation(7.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_DEATH, lMove);
      CutPlayAnimation(7.0, oSpiritx, ANIMATION_LOOPING_SPASM, 3.0);
      DelayCommand(7.2, DoReactions(iCut, oSpirit1, oSpirit2, oSpirit3, oSpirit4, oPC));
      CutPlaySound(7.5, oPC, "vs_ndruidm1_dead");
      CutApplyEffectToObject(7.7, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oSpiritx);
      CutDestroyObject(7.9, oSpiritx);

      // End scene.
      CutFadeOutAndIn(9.5, oPC, 1.5);
      DelayCommand(10.3, ClearParty(oPC, iCut));
      CutDisableCutscene(iCut, 10.5, 10.5, RESTORE_TYPE_NORMAL);
}

// Have others react around him.
void DoReactions(int iCut, object oSpirit1, object oSpirit2, object oSpirit3, object oSpirit4, object oPC)
{
    if(iCut == GetLocalInt(oSpirit1, "nCutsceneNumber"))
    {
        AddJournalQuestEntry("hx_spirits", 10, oPC, TRUE, TRUE);

        //Give non-repeatable XP
        int i2daRow = 69;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }

        CutSetFacingPoint(0.0, oSpirit1, "hx_cut700_spirit_move_wp");
        CutSetFacingPoint(0.2, oSpirit2, "hx_cut700_spirit_move_wp");
        CutSetFacingPoint(0.4, oSpirit3, "hx_cut700_spirit_move_wp");
        CutSetFacingPoint(0.7, oSpirit4, "hx_cut700_spirit_move_wp");

        CutPlayAnimation(0.5, oSpirit1, ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 3.0);
        CutPlayAnimation(0.7, oSpirit2, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
        CutPlayAnimation(0.9, oSpirit3, ANIMATION_LOOPING_TALK_PLEADING, 3.0);
        CutPlayAnimation(1.2, oSpirit4, ANIMATION_FIREFORGET_TAUNT, 3.0);
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
