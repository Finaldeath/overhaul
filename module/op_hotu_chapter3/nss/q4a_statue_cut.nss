//::///////////////////////////////////////////////
//:: Name q4a_statue_cut
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will start a tiny cutscene that
     will show the statues in front of the cave
     blowing up to open the path.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 14, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void StartCutscene(object oPC, int iCut);
void main()
{
   object oPC = GetLastUsedBy();
   int iPulled = GetLocalInt(OBJECT_SELF, "on");
   // Cutscene number.
   int iCut = 50;

   // Don't let a polymorphed PC pull the switch.  Give them appropriate
   // feedback
   if(GetAppearanceType(oPC) == APPEARANCE_TYPE_FAIRY) {
      //SpeakString("[NOT IN STRING EDITOR] You are too small to operate the lever.");
      SpeakStringByStrRef(85508);
   }
   else if(GetAppearanceType(oPC) == APPEARANCE_TYPE_DOG_WOLF) {
      //SpeakString("[NOT IN STRING EDITOR] You cannot pull the lever with your paws.");
      SpeakStringByStrRef(85509);
   }
   else if(GetAppearanceType(oPC) == APPEARANCE_TYPE_UMBERHULK) {
      //SpeakString("[NOT IN STRING EDITOR] You are too large to operate the lever.");
      SpeakStringByStrRef(85510);
   }
   else if(GetAppearanceType(oPC) != APPEARANCE_TYPE_DWARF &&
           GetAppearanceType(oPC) != APPEARANCE_TYPE_ELF &&
           GetAppearanceType(oPC) != APPEARANCE_TYPE_HUMAN &&
           GetAppearanceType(oPC) != APPEARANCE_TYPE_HALF_ORC &&
           GetAppearanceType(oPC) != APPEARANCE_TYPE_HALFLING &&
           GetAppearanceType(oPC) != APPEARANCE_TYPE_GNOME &&
           GetAppearanceType(oPC) != APPEARANCE_TYPE_HALF_ELF) {
      //SpeakString("[NOT IN STRING EDITOR] You cannot operate the lever in this form");
      SpeakStringByStrRef(85511);
   }
   else if(iPulled == 0) {
      PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
      SetLocalInt(OBJECT_SELF, "on", 1);
      // Store the camera.
      // CutStoreCameraFacing(iCut, 0.0, oPC);
      // Set the cutscene number on the PC.
      // SetLocalInt(oPC, "nCutsceneNumber", iCut);
      // Set the PC location.
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);
      CutSetLocation(0.0, oPC);
      DelayCommand(1.0, StartCutscene(oPC, iCut));
   }
   else {
      // Don't let a polymorphed PC pull the switch.  Give them appropriate
      // feedback
      if(GetAppearanceType(oPC) == APPEARANCE_TYPE_FAIRY) {
         //SpeakString("[NOT IN STRING EDITOR] You are too small to operate the lever.");
         SpeakStringByStrRef(85508);
      }
      else if(GetAppearanceType(oPC) == APPEARANCE_TYPE_DOG_WOLF) {
         //SpeakString("[NOT IN STRING EDITOR] You cannot pull the lever with your paws.");
         SpeakStringByStrRef(85509);
      }
      else if(GetAppearanceType(oPC) == APPEARANCE_TYPE_ELEMENTAL_EARTH_ELDER) {
         //SpeakString("[NOT IN STRING EDITOR] You cannot operate the lever in this form");
         SpeakStringByStrRef(85510);
      }
      else
         //SpeakString("[NOT IN STRING EDITOR] Nothing happens.");
         SpeakStringByStrRef(85512);
   }
}

void StartCutscene(object oPC, int iCut) {
   // Store locations for the copy.
   //StoreCampaignObject("cutscene50", "ThePlayer", oPC);
   //SetLocalLocation(oPC, "cut50", GetLocation(oPC));
   location lLoc2 = GetLocation(oPC);
   //object oCopy = RetrieveCampaignObject("cutscene50", "ThePlayer", lLoc2);
   object oCopy = CutCreatePCCopy(oPC, lLoc2, "PC_Copy");
   // Cutscene objects - statues and trigger.
   // Statues.
   object oStatue1 = GetObjectByTag("q4a_statue1");
   object oStatue2 = GetObjectByTag("q4a_statue2");
   object oStatue3 = GetObjectByTag("q4a_statue3");
   object oStatue4 = GetObjectByTag("q4a_statue4");
   object oStatue5 = GetObjectByTag("q4a_statue5");

   CutSetActiveCutsceneForObject(oStatue1, iCut);
   CutSetActiveCutsceneForObject(oStatue2, iCut);
   CutSetActiveCutsceneForObject(oStatue3, iCut);
   CutSetActiveCutsceneForObject(oStatue4, iCut);
   CutSetActiveCutsceneForObject(oStatue5, iCut);

   // Trigger.
   object oStatue6 = GetObjectByTag("q4a_statue6");
   CutSetActiveCutsceneForObject(oStatue6, iCut);
   // Jump location.
   location lLoc = GetLocation(GetWaypointByTag("q4a_cutjump_wp"));

   // Setup the cutscene. Destroy the trigger now. Adjust the camera.
   CutBlackScreen(0.0, oPC);
   CutJumpToLocation(0.3, oPC, lLoc);
   CutSetCutsceneMode(0.1, oPC, TRUE, CUT_CAMERA_HEIGHT_LOW);
   CutRemoveEffects(0.1, oPC);
   CutDestroyObject(0.1, oStatue6);
   //CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oPC);
   CutSetCamera(0.1, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 17.0, 50.0,
                CAMERA_TRANSITION_TYPE_SNAP);
   //CutJumpToLocation(0.2, oCopy, lLoc2);
   CutStopFade(0.5, oPC);

   // Set ints on the plot statues so they know what cutscene is running.
   // This will allow them to bypass the check. Do this for the copy too.
   /*SetLocalInt(oStatue1, "nCutsceneNumber", iCut);
   SetLocalInt(oStatue2, "nCutsceneNumber", iCut);
   SetLocalInt(oStatue3, "nCutsceneNumber", iCut);
   SetLocalInt(oStatue4, "nCutsceneNumber", iCut);
   SetLocalInt(oStatue5, "nCutsceneNumber", iCut);
   SetLocalInt(oStatue6, "nCutsceneNumber", iCut);
   SetLocalInt(oCopy, "nCutsceneNumber", iCut);
   */
   // Destroy the statues. First turn their plots off.
   CutSetPlotFlag(0.5, oStatue1, 0);
   CutSetPlotFlag(0.5, oStatue2, 0);
   CutSetPlotFlag(0.5, oStatue3, 0);
   CutSetPlotFlag(0.5, oStatue4, 0);
   CutSetPlotFlag(0.5, oStatue5, 0);

   // Dramatic camera movement.
   CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 7.0, 50.0,
                CAMERA_TRANSITION_TYPE_SLOW);


   // Apply effects to the statues.
   CutApplyEffectToObject(1.3, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oStatue4);
   CutApplyEffectToObject(1.5, DURATION_TYPE_INSTANT, VFX_FNF_IMPLOSION, oStatue4);
   CutApplyEffectToObject2(5.2, DURATION_TYPE_INSTANT, EffectDamage(1000), oStatue4);

   CutApplyEffectToObject(3.3, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oStatue3);
   CutApplyEffectToObject(3.5, DURATION_TYPE_INSTANT, VFX_FNF_IMPLOSION, oStatue3);
   CutApplyEffectToObject2(7.2, DURATION_TYPE_INSTANT, EffectDamage(1000), oStatue3);

   CutApplyEffectToObject(5.3, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oStatue2);
   CutApplyEffectToObject(5.5, DURATION_TYPE_INSTANT, VFX_FNF_IMPLOSION, oStatue2);
   CutApplyEffectToObject2(9.2, DURATION_TYPE_INSTANT, EffectDamage(1000), oStatue2);

   CutApplyEffectToObject(7.3, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oStatue1);
   CutApplyEffectToObject(7.5, DURATION_TYPE_INSTANT, VFX_FNF_IMPLOSION, oStatue1);
   CutApplyEffectToObject2(11.2, DURATION_TYPE_INSTANT, EffectDamage(1000), oStatue1);

   CutApplyEffectToObject(9.3, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oStatue5);
   CutApplyEffectToObject(9.5, DURATION_TYPE_INSTANT, VFX_FNF_IMPLOSION, oStatue5);
   CutApplyEffectToObject2(13.2, DURATION_TYPE_INSTANT, EffectDamage(1000), oStatue5);

   // Reset the PC postion and camera settings. Get rid of the PC copy.
   //CutJumpToLocation(14.2, oCopy, GetLocation(GetWaypointByTag("wp_cut20_pccopy_start")));
   //CutDestroyObject(14.2, oCopy);
   //CutRestoreLocation(14.4, oPC);
   //CutRestoreCameraFacing(14.4, oPC);
   //CutRemoveEffects(14.4, oPC);
   CutFadeOutAndIn(15.5, oPC, 1.5);
   CutDisableCutscene(iCut, 16.4, 14.4);
}
