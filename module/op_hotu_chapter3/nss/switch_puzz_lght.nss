////////////////////////////////////////////////////////////////////////////////////
// This script is for the levers that controls the light beams.  There are 5
// different lights and their corresponding beams that can result from pulling
// a switch. This script is universal, and will work on all of the light controlling
// levers.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////

void MakeLight(location lLoc, object oStatue, location lStatue, int iLight);

void main()
{
   object oPC = GetLastUsedBy();
   // Get the statue that corresponds to this lever.  To make a universal
   // script, the tag of the switch corresponds to the tag of the statue it
   // is paired with once the last 3 characters are cut off.  This is done
   // so that "GetByTag" functions still work as they should.
   object oStatue = GetNearestObjectByTag(GetStringLeft(GetTag(OBJECT_SELF), 14));
   location lStatue = GetLocation(oStatue);
   int iPulled = GetLocalInt(OBJECT_SELF, "pulled");
   // Check to see if a light is there.
   int iLight = GetLocalInt(OBJECT_SELF, "light");

   // Do the same regardless of activated state, but do appropriate animation.
   if(iPulled == 0) {
      SetLocalInt(OBJECT_SELF, "pulled", 1);
      ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
      MakeLight(GetLocation(OBJECT_SELF), oStatue, lStatue, iLight);
   }
   else {
      SetLocalInt(OBJECT_SELF, "pulled", 0);
      ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
      MakeLight(GetLocation(OBJECT_SELF), oStatue, lStatue, iLight);
   }
}

void MakeLight(location lLoc, object oStatue, location lStatue, int iLight) {
   // Resrefs for the lights.
   string sOrange = "orange_light";
   string sYellow = "yellow_light";
   string sRed = "red_light";
   string sBlue = "blue_light";
   string sPink = "pink_light";
   // Variable for the final color choice.
   string sColor;
   // Variable for random roll on light colors.
   int x;

   x = 0;
   x = d6(1);

   // Determine the color of the light that will appear. Set an int on the statue
   // so we can access what beam to cast when the puzzle is solved. Give the correct
   // light (blue for lightning) a slightly better chance of appearing from pulling
   // the switch.
   switch(x) {
   case 1:
       sColor = sOrange;
       SetLocalInt(oStatue, "beam", VFX_BEAM_FIRE);
       break;
   case 2:
       sColor = sYellow;
       SetLocalInt(oStatue, "beam", VFX_BEAM_HOLY);
       break;
   case 3:
       sColor = sRed;
       SetLocalInt(oStatue, "beam", VFX_BEAM_EVIL);
       break;
   case 4:
       sColor = sPink;
       SetLocalInt(oStatue, "beam", VFX_BEAM_ODD);
       break;
   default:
       sColor = sBlue;
       SetLocalInt(oStatue, "beam", VFX_BEAM_LIGHTNING);
       break;
   }

   // After the first random selection, follow the following order:
   // yellow - red - blue - pink - orange.
   if(GetName(GetNearestObjectByTag("puzzle_light")) == "Yellow Light") {
      sColor = sRed;
      SetLocalInt(oStatue, "beam", VFX_BEAM_EVIL);
   }
   else if(GetName(GetNearestObjectByTag("puzzle_light")) == "Red Light") {
      sColor = sBlue;
      SetLocalInt(oStatue, "beam", VFX_BEAM_LIGHTNING);
   }
   else if(GetName(GetNearestObjectByTag("puzzle_light")) == "Blue Light") {
      sColor = sOrange;
      SetLocalInt(oStatue, "beam", VFX_BEAM_FIRE);
   }
   else if(GetName(GetNearestObjectByTag("puzzle_light")) == "Orange Light") {
      sColor = sPink;
      SetLocalInt(oStatue, "beam", VFX_BEAM_ODD);
   }
   else if(GetName(GetNearestObjectByTag("puzzle_light")) == "Pink Light") {
      sColor = sYellow;
      SetLocalInt(oStatue, "beam", VFX_BEAM_HOLY);
   }
   // Check if we have made any beams yet.  If so, destroy them and make new ones.
   if(iLight != 1) {
      if(sColor == sBlue) {
         DelayCommand(0.5, PlaySound("sco_megrdevil01"));
         DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), OBJECT_SELF));
      }
      else
         DelayCommand(0.5, PlaySound("sdr_magresist"));
      CreateObject(OBJECT_TYPE_PLACEABLE, sColor, lLoc);
      CreateObject(OBJECT_TYPE_PLACEABLE, sColor, lStatue);
      SetLocalInt(OBJECT_SELF, "light", 1);
   }
   else {
      if(sColor == sBlue) {
         DelayCommand(0.5, PlaySound("sco_megrdevil01"));
         DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), OBJECT_SELF));
      }
      else
         DelayCommand(0.5, PlaySound("sdr_magresist"));
      DestroyObject(GetNearestObjectByTag("puzzle_light"));

      // Destroy the lights on the statues. Cleanup radius is marked by the same
      // tag as the corresponding switch, with a _c at the end of the tag to
      // preserve uniqueness for "GetByTag" functions.
      object oCleanup = GetWaypointByTag(GetTag(OBJECT_SELF) + "_c");
      location lCleanup = GetLocation(oCleanup);
      int iNth = 1;
      object oLight = GetNearestObjectByTag("puzzle_light", OBJECT_SELF, iNth);
      location lLight;
      while(oLight != OBJECT_INVALID) {
         lLight = GetLocation(oLight);
         if(GetDistanceBetweenLocations(lCleanup, lLight) < 5.0)
            DestroyObject(oLight);
         iNth++;
         oLight = GetNearestObjectByTag("puzzle_light", OBJECT_SELF, iNth);
      }

      CreateObject(OBJECT_TYPE_PLACEABLE, sColor, lLoc);
      CreateObject(OBJECT_TYPE_PLACEABLE, sColor, lStatue);
   }
}
