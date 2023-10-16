//::///////////////////////////////////////////////
//:: Name q4a_ox_revive
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will fire when the PC has given
     the Magic Water for Bessy.  It will cause the
     fake "dead" ox to disappear and the real one
     to be spawned in. It will also fire Bessy's
     heartbeat even so that she destroys the
     boulders in the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 8, 2003
//:://////////////////////////////////////////////
void MakeOx(location lLoc);
void main()
{
   // Donan.
   object oDonan = GetObjectByTag("q4a_donan");
   // The invis Bessy (highlightable), and the dead corpse.
   object oInvis = GetObjectByTag("q4a_bessy_invis");
   object oDead = GetObjectByTag("q4a_bessy_dead");
   // Spawn point.
   object oSpawn = GetWaypointByTag("q4a_oxspawn_wp");
   location lLoc = GetLocation(oSpawn);
   // First stop.
   object oMove = GetWaypointByTag("q4a_donan_wp1");
   location lLoc2 = GetLocation(oMove);
   // Ox sound
   string sSound = "as_an_cow1";

   // Have Donan feed Bessy the Magic Water.
   AssignCommand(oDonan, SetFacing(215.0));
   DelayCommand(0.5, AssignCommand(oDonan, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0)));
   AssignCommand(oDead, SetIsDestroyable(TRUE));
   SetPlotFlag(oInvis, TRUE);
   DelayCommand(2.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_X), lLoc));
   DestroyObject(oDead, 4.3);
   DestroyObject(oInvis, 4.3);
   DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION), lLoc));
   // Create the real Bessy.
   DelayCommand(4.3, MakeOx(lLoc));
   DelayCommand(5.8, AssignCommand(oDonan, PlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 2.0)));
   //DelayCommand(6.9, AssignCommand(oDonan, SpeakString("[NOT IN STRING EDITOR] Bessy!")));
   DelayCommand(6.3, AssignCommand(GetObjectByTag("q4a_bessy_ox"), PlaySound(sSound)));
   DelayCommand(6.4, AssignCommand(GetObjectByTag("q4a_bessy_ox"), PlayAnimation(ANIMATION_FIREFORGET_TAUNT)));
   //DelayCommand(9.0, AssignCommand(oDonan, SpeakString("[NOT IN STRING EDITOR] Go to it, girl.")));
   // Fire the UD heartbeat, then set the regular hb to fire.
   DelayCommand(9.3, SignalEvent(GetObjectByTag("q4a_bessy_ox"), EventUserDefined(1001)));
   DelayCommand(10.0, SetLocalInt(GetObjectByTag("q4a_bessy_ox"), "bessy_hb", 1));
}

void MakeOx(location lLoc) {
   CreateObject(OBJECT_TYPE_CREATURE, "q4a_ox", lLoc);
}

