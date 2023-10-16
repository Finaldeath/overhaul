///////////////////////////////////////////////////////////////////////////////////
// This script is for the gargoyle statues that get spun for the puzzle. Each click
// will turn them to a new facing. When all 3 are set to face the door, a sound
// effect and a screen shake will happen to clue the PC in that they did something
// right. This will also tell the final lever that it is set correctly.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
   object oPC = GetLastUsedBy();

   //Copied in by Rob from "statuetalk"
   int bDoOnce = GetLocalInt(GetModule(), "bGargoyleLightningPuzzleDoOnce");
   if (bDoOnce == FALSE)
   {
       SetLocalInt(GetModule(), "bGargoyleLightningPuzzleDoOnce", TRUE);

       //SpeakString("[NOT IN STRING EDITOR] Etched words read, 'Stone to stone, the stone turns. Lightning to lightning, the lightning fades.'");
       SpeakStringByStrRef(85514);
       AddJournalQuestEntry("q4a_gargs", 10, oPC, TRUE, TRUE);

        //Give non-repeatable XP
        int i2daRow = 119;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }

   object oStatue1 = GetObjectByTag("puzzle_statue1");
   object oStatue2 = GetObjectByTag("puzzle_statue2");
   object oStatue3 = GetObjectByTag("puzzle_statue3");
   float fFacing1 = GetFacing(oStatue1);
   float fFacing2 = GetFacing(oStatue2);
   float fFacing3 = GetFacing(oStatue3);
   // This will be set to the new facing when a PC clicks on the statue.
   float fNewFacing;
   int iActive = GetLocalInt(OBJECT_SELF, "active");

   //Get the current direction that is faced. Compensate for a misplaced statue.
   if(GetFacing(OBJECT_SELF) >= 0.0 && GetFacing(OBJECT_SELF) < 45.0)
      fNewFacing = 45.0;
   else if(GetFacing(OBJECT_SELF) >= 45.0 && GetFacing(OBJECT_SELF) < 90.0)
      fNewFacing = 90.0;
   else if(GetFacing(OBJECT_SELF) >= 90.0 && GetFacing(OBJECT_SELF) < 135.0)
      fNewFacing = 135.0;
   else if(GetFacing(OBJECT_SELF) >= 135.0 && GetFacing(OBJECT_SELF) < 180.0)
      fNewFacing = 180.0;
   else if(GetFacing(OBJECT_SELF) >= 180.0 && GetFacing(OBJECT_SELF) < 225.0)
      fNewFacing = 225.0;
   else if(GetFacing(OBJECT_SELF) >= 225.0 && GetFacing(OBJECT_SELF) < 270.0)
      fNewFacing = 270.0;
   else if(GetFacing(OBJECT_SELF) >= 270.0 && GetFacing(OBJECT_SELF) < 315.0)
      fNewFacing = 315.0;
   else
      fNewFacing = 0.0;

   // Check to see if the puzzle has been done already.  If so, don't move the statues.
   if(iActive != 1) {
      //FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The statue turns in place.", oPC, FALSE);
      FloatingTextStrRefOnCreature(85532, oPC, TRUE);
      PlaySound("as_dr_stonmedop1");
      SetFacing(fNewFacing);
   }
   if(GetFacing(oStatue1) == 135.0 && GetFacing(oStatue2) == 180.0
      && GetFacing(oStatue3) == 225.0) { // Opposite because statue facing is backwards.
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), OBJECT_SELF);
      // Tell the final lever that the statues are in position.
      SetLocalInt(GetObjectByTag("final_lever"), "ready", 1);
      DelayCommand(0.5, PlaySound("sco_megrdevil01"));
   }
   else
      // Tell the final lever that the statues are not in position.
      SetLocalInt(GetObjectByTag("final_lever"), "ready", 0);
}
