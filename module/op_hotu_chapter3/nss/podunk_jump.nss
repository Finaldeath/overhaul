////////////////////////////////////////////////////////////////////////////////////
// This script will keep the PC from leaving the fighting area around Podunk, once
// the battle begins. It is used on the OnEnter of a trigger.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oPC = GetEnteringObject();
   int iFighting = GetLocalInt(GetObjectByTag("ped44"), "fighting");
   object oWP = GetWaypointByTag("podunk_jump");
   location lLoc = GetLocation(oWP);

   if(iFighting == 1) {
      AssignCommand(oPC, ClearAllActions());
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_10), oPC);
      //DelayCommand(0.2, SendMessageToPC(oPC, "[NOT IN STRING EDITOR] The way out is blocked by a lightning barrier."));
      DelayCommand(0.5, AssignCommand(oPC, JumpToLocation(lLoc)));
   }
}
