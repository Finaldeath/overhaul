//::///////////////////////////////////////////////
//:: Scrivener, Quest Complete (Action Script)
//:: H2a_Scrv_Done.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the Quest as being complete and perform
     a little cutscene.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//::            Added cutscene.
//:: Created On: August 11, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_plot"
// Standard cutscene start
void StartCutscene(object oPC, int iCut);
void Resume(object oScriv, int iCut, object oPC);

void main()
{
    //Flag the Quest as being completed.
    SetLocalInt(GetModule(), "bScrivenerQuestComplete", TRUE);
    SetLocalInt(GetModule(), "Scriv_conv_cutscene", TRUE);
    int iCut = 670;
    //Remove Scrivener from party.
    object oPC = GetPCSpeaker();
    object oInvis = GetObjectByTag("hx_scriv_cutscene");

    RemoveHenchman(oPC);
    BlackScreen(oPC);
    //Remove the VFX from Aribeth's entrance
    //object oVFX = GetObjectByTag("AribethDoorVFX000");
    //DestroyObject(oVFX);

    //Make the Scrivener immortal
    SetImmortal(OBJECT_SELF, TRUE);

    //Add journal entry
    AddJournalQuestEntry("XP2_Scrivener", 60, oPC, TRUE, TRUE);
    //Give non-repeatable XP
    int i2daRow = 131;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    //ActionPauseConversation();
    //Cutscene stuff to be implemented later...
    AssignCommand(oInvis, StartCutscene(oPC, iCut));
}

void StartCutscene(object oPC, int iCut)
{
      location lLoc = GetLocation(GetObjectByTag("hx_end_battle_copy_spawn_wp"));

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

      // Cutscene objects other than the PC.
      object oScriv = GetNearestObjectByTag("H2_Scrivener", oPC);
      CutSetActiveCutsceneForObject(oScriv, iCut);
      object oVFX = GetObjectByTag("AribethDoorVFX000");
      CutSetActiveCutsceneForObject(oVFX, iCut);
      object oTarget = GetObjectByTag("hx_scriv_target");
      CutSetActiveCutsceneForObject(oTarget, iCut);

      // PC Copy.
      //object oPCCopy = CutCreatePCCopy(oPC, lLoc, "HX_PC_SCRIV");
     //CutSetActiveCutsceneForObject(oPCCopy, iCut);

      // Waypoints.
      location lPCStart = GetLocation(GetNearestObjectByTag("hx_scriv_pc_start_wp", oPC));
      location lPCJump = GetLocation(GetNearestObjectByTag("hx_scriv_pc_jump_wp", oPC));
      location lScriv = GetLocation(GetNearestObjectByTag("hx_scriv_start_wp", oPC));

      // Setup the cutscene.
      CutSetCutsceneMode(0.1, oPC, TRUE, FALSE, TRUE, 2);

      CutSetCamera(1.2, oPC, CAMERA_MODE_TOP_DOWN, 300.0, 5.0, 75.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(0.5, oPC, lPCStart);
      CutJumpToLocation(0.5, oScriv, lScriv);
      CutFadeFromBlack(1.5, oPC, FADE_SPEED_MEDIUM);

      // Start the scene.
      CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 320.0, 3.0, 75.0,
                   CAMERA_TRANSITION_TYPE_VERY_SLOW);

      CutPlaySound(4.6, oScriv, "c_devourer_hit1");
      CutPlayAnimation(4.8, oScriv, ANIMATION_LOOPING_SPASM, 6.0);
      CutApplyEffectToObject2(5.0, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_COLD, oScriv, BODY_NODE_CHEST), oTarget, 5.0);

      CutFadeToBlack(9.2, oPC, FADE_SPEED_FASTEST);
      CutJumpToLocation(10.0, oPC, lPCJump);
      CutApplyEffectToObject(10.3, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oPC);
      CutSetCamera(10.2, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 3.0, 85.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutFadeFromBlack(10.5, oPC);
      CutApplyEffectAtLocation(11.5, oPC, DURATION_TYPE_INSTANT, VFX_FNF_DISPEL_GREATER, GetLocation(oVFX));
      CutDestroyObject(12.5, oVFX);
      CutFadeToBlack(16.0, oPC, FADE_SPEED_FASTEST);
      CutJumpToLocation(16.8, oPC, lPCStart);
      CutSetCamera(17.0, oPC, CAMERA_MODE_TOP_DOWN, 300.0, 4.0, 75.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutRemoveEffects(17.0, oPC);
      CutFadeFromBlack(17.5, oPC);
      CutPlaySound(18.15, oScriv, "c_devourer_slct");
      //CutPlayAnimation(18.3, oScriv, ANIMATION_FIREFORGET_TAUNT, 1.0);

      // End scene.
      CutFadeOutAndIn(19.3, oPC, 1.5);
      DelayCommand(19.9, Resume(oScriv, iCut, oPC));
      CutDisableCutscene(iCut, 20.0, 20.0, RESTORE_TYPE_NONE);

}

void Resume(object oScriv, int iCut, object oPC)
{
    if(iCut == GetLocalInt(oScriv, "nCutsceneNumber"))
    {
        location lLoc = GetLocation(GetObjectByTag("hx_scriv_end_wp"));

        AssignCommand(oScriv, ActionJumpToLocation(lLoc));
        DelayCommand(0.8, AssignCommand(oScriv, ActionStartConversation(oPC)));
    }
}
