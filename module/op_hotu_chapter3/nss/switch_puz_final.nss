////////////////////////////////////////////////////////////////////////////////////
// This script is for the final lever of the lightning door/rotating arrow puzzle.
// When the gargoyles have been turned to face the door and when the lights for the
// gargoyles have been set to blue so that they shoot lightning, pulling this lever
// will open the lightning door. If the gargoyles have been set properly, but the
// lights are incorrect, it will fire beams that correspond to the color of the light
// from the switches and on the gargoyles. This is done to give the PC a hint if
// they have figured out everything but the colors.
//
// Various other "flavor" effects have been added, described below.
//
// This puzzle will also reset itself 10 minutes after it has been done, so that the next PC
// who enters can do it as well.  This is what the function DoCleanup accomplishes.
//
// XP is awarded, set as iXP, which can easily be changed. The journal will be updated.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////
#include "nw_i0_plot"
void DoCleanup();

void main()
{
   object oPC = GetLastUsedBy();
   // Get all of the statues and their locations.
   object oStatue1 = GetNearestObjectByTag("puzzle_statue1");
   object oStatue2 = GetNearestObjectByTag("puzzle_statue2");
   object oStatue3 = GetNearestObjectByTag("puzzle_statue3");
   location lStatue1 = GetLocation(oStatue1);
   location lStatue2 = GetLocation(oStatue2);
   location lStatue3 = GetLocation(oStatue3);
   // Get the puzzle door.
   object oDoor = GetObjectByTag("puzzle_door");
   // Get the ints from the statues so we know what beam to use if the puzzle is
   // set correctly.
   int iStatue1Beam = GetLocalInt(oStatue1, "beam");
   int iStatue2Beam = GetLocalInt(oStatue2, "beam");
   int iStatue3Beam = GetLocalInt(oStatue3, "beam");
   // Check to see if switch is pulled or not.
   int iPulled = GetLocalInt(OBJECT_SELF, "pulled");
   int iReady = GetLocalInt(OBJECT_SELF, "ready");
   // XP reward.  Change this for other amounts.
   int iXP = 3000;


   // Do the same regardless of activated state, but do appropriate animation.
   if(iPulled == 0) {
      SetLocalInt(OBJECT_SELF, "pulled", 1);
      ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
      if(iReady == 1) {
         // See if all beams are correct. If so, open the door and do some cleanup
         // so that the puzzle is reset for the next run. Otherwise, fire whatever
         // beams have been set, and do nothing else.
         if(iStatue1Beam == VFX_BEAM_LIGHTNING && iStatue2Beam == VFX_BEAM_LIGHTNING
            && iStatue3Beam == VFX_BEAM_LIGHTNING) {
            DelayCommand(0.5, PlaySound("sco_megrdevil01"));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), OBJECT_SELF);
            AssignCommand(oStatue1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue1Beam), oDoor, 5.0));
            AssignCommand(oStatue2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue2Beam), oDoor, 5.0));
            AssignCommand(oStatue3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue3Beam), oDoor, 5.0));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oDoor));
            DelayCommand(5.0, AssignCommand(oDoor, ActionOpenDoor(OBJECT_SELF)));
            DelayCommand(5.5, AddJournalQuestEntry("q4a_gargs", 20, oPC, TRUE, TRUE));
            //Give non-repeatable XP
            int i2daRow = 120;
            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                DelayCommand(5.5, Reward_2daXP(oPC, i2daRow));
            }
            DelayCommand(6.0, DoCleanup());
            //DelayCommand(6.5, GiveXPToCreature(oPC, iXP));
         }
         else {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), OBJECT_SELF);
            AssignCommand(oStatue1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue1Beam), oDoor, 5.0));
            AssignCommand(oStatue2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue2Beam), oDoor, 5.0));
            AssignCommand(oStatue3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue3Beam), oDoor, 5.0));
            //AssignCommand(oPC, DelayCommand(6.1, SpeakString("[NOT IN STRING EDITOR] That didn't work. There must be something wrong here.")));
            DelayCommand(6.1, SendMessageToPCByStrRef(oPC, 85516));
         }
      }
      else
         //SpeakString("[NOT IN STRING EDITOR] Nothing happens.");
         SpeakStringByStrRef(85512);
   }
   else {
      SetLocalInt(OBJECT_SELF, "pulled", 0);
      ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
      if(iReady == 1) {
         // See if all beams are correct. If so, open the door and do some cleanup
         // so that the puzzle is reset for the next run. Otherwise, fire whatever
         // beams have been set, and do nothing else.
         if(iStatue1Beam == VFX_BEAM_LIGHTNING && iStatue2Beam == VFX_BEAM_LIGHTNING
            && iStatue3Beam == VFX_BEAM_LIGHTNING) {
            DelayCommand(0.5, PlaySound("sco_megrdevil01"));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), OBJECT_SELF);
            AssignCommand(oStatue1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue1Beam), oDoor, 5.0));
            AssignCommand(oStatue2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue2Beam), oDoor, 5.0));
            AssignCommand(oStatue3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue3Beam), oDoor, 5.0));
            DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oDoor));
            DelayCommand(5.0, AssignCommand(oDoor, ActionOpenDoor(OBJECT_SELF)));

            //Give non-repeatable XP
            int i2daRow = 120;
            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                DelayCommand(5.5, Reward_2daXP(oPC, i2daRow));
            }
            DelayCommand(6.0, DoCleanup());
            //DelayCommand(6.5, GiveXPToCreature(oPC, iXP));
         }
         else {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), OBJECT_SELF);
            AssignCommand(oStatue1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue1Beam), oDoor, 5.0));
            AssignCommand(oStatue2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue2Beam), oDoor, 5.0));
            AssignCommand(oStatue3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iStatue3Beam), oDoor, 5.0));
            //AssignCommand(oPC, DelayCommand(6.1, SpeakString("[NOT IN STRING EDITOR] That didn't work. There must be something wrong here.")));
            DelayCommand(6.1, SendMessageToPCByStrRef(oPC, 85516));
        }
      }
      else
         //SpeakString("[NOT IN STRING EDITOR] Nothing happens. Perhaps something else needs to be done first.");
         SpeakStringByStrRef(85517);
   }
}

void DoCleanup() {
   ClearAllActions();
   // Kill all the light beams.
   int iNth = 1;
   object oLight = GetNearestObjectByTag("puzzle_light", OBJECT_SELF, iNth);
   while(oLight != OBJECT_INVALID) {
      DestroyObject(oLight);
      iNth++;
      oLight = GetNearestObjectByTag("puzzle_light", OBJECT_SELF, iNth);
   }

   // Reset the variables on the light levers so that the puzzle can be done again.
   iNth = 1;
   object oLightLever = GetObjectByTag("puzzle_statue" + IntToString(iNth) + "_l");
   while(oLightLever != OBJECT_INVALID) {
      SetLocalInt(oLightLever, "light", 0);
      iNth++;
      oLightLever = GetObjectByTag("puzzle_statue" + IntToString(iNth) + "_l");
   }

   // Reset the statues to their starting positions.  *Note* Directions on the statues
   // are backwards. Delete the beam ints that are stored.
   iNth = 1;
   object oStatue = GetObjectByTag("puzzle_statue" + IntToString(iNth));
   while(oStatue != OBJECT_INVALID) {
      AssignCommand(GetObjectByTag("puzzle_statue" + IntToString(iNth)), SetFacing(0.0));
      DeleteLocalInt(oStatue, "beam");
      iNth++;
      oStatue = GetObjectByTag("puzzle_statue" + IntToString(iNth));
   }
   // Reset variable on the final switch
   SetLocalInt(OBJECT_SELF, "ready", 0);

   // Assign the door to close itself after 10 minutes.
   //DelayCommand(600.0, AssignCommand(GetObjectByTag("puzzle_door"), ActionCloseDoor(OBJECT_SELF)));

   // Turn off the lightning sound for the door.  Turn on smoke one in its place.
   // Reset them both after the 10 minute reset time is up. Start background music.
   object oLightningSound = GetObjectByTag("lightning_sound");
   object oSmokeSound = GetObjectByTag("smoke_sound");
   SoundObjectStop(oLightningSound);
   SoundObjectPlay(oSmokeSound);
   DelayCommand(20.0, MusicBackgroundPlay(GetArea(OBJECT_SELF)));
   //DelayCommand(600.0, SoundObjectStop(oSmokeSound));
   //DelayCommand(600.0, SoundObjectPlay(oLightningSound));

   // Toggle the switch the bumps people back from the lightning door.  Reset it
   // after 10 minutes.
   SetLocalInt(GetObjectByTag("move_door"), "done", 1);
   //DelayCommand(600.0, SetLocalInt(GetObjectByTag("move_door"), "done", 0));
}
