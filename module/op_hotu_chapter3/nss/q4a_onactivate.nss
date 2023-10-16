//::///////////////////////////////////////////////
//:: Name q4a_onactivate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Custom item activates are in this script.
     See each below for specifics.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void CheckGong(object oActivator, string sGong);
void MakeItem(location lLoc, string sItem, object oActivator);
void DelayCreateObject(int iType, string sRes, location lLoc);
// Break the item the hand hits.
void BreakItem(object oObject, object oActivator);
// Jump PC and associates.
void AllJumpToLocation(object oObject, location lLoc);

void main()
{
   object oItem = GetItemActivated();
   // ResRef in case we need it.
   string sRes = GetResRef(oItem);
   object oUser = GetItemActivator();
   object oTarget = GetItemActivatedTarget();
   // The fountain and the 2 closest lights.
   object oFountain = GetObjectByTag("q4a_magic_fountain");
   location lLoc = GetLocation(oFountain);
   // Fountain int to determine if leaf has been used on it yet.
   int iMagic = GetLocalInt(oFountain, "magic");

   ExecuteScript("x2_onitemactive", OBJECT_SELF);


   // Worg cloak. Summons companions.
   if(GetTag(oItem) == "hx_worg_cloak")
   {
      location lLoc = GetLocation(oUser);
      ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WORD), lLoc);
      DelayCommand(0.5, AllJumpToLocation(oUser, lLoc));
   }

   // Velox Potion
   if(GetTag(oItem) == "hx_berry_potion")
   {
      SendMessageToPCByStrRef(oUser, 86880);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_S), oUser);
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PIXIEDUST), oUser, 6.0);
      SetLocalInt(oUser, "HX_FIRETYPE", 3);
      SetLocalInt(oUser, "HX_FIRETYPE_SAFE", 0);
      SetLocalInt(oUser, "HX_FIRE_POTION", 1);
   }

   // Trumpet of Pandamonium
   if(GetTag(oItem) == "H2_Trumpet")
   {
      AssignCommand(oUser, PlaySound("as_cv_eulpipe2"));
      //AssignCommand(oUser, PlaySound("mus_sbat_endboss"));
   }

   // This is for the morphing crystal. It will start a conversation
   // with the PC for them to choose what shape they want.
   if(GetTag(oItem) == "H2_SenseiAmulet")
   {
      float fDelay = 0.0;

      AssignCommand(oUser, ClearAllActions(TRUE));
      DelayCommand(fDelay, AssignCommand(oUser, ActionStartConversation(oUser, "q4a_morph_conv", TRUE, FALSE)));
   }

   // Debug amulet.
   if(GetTag(oItem) == "q4a_morph")
   {
      float fDelay = 0.5;

      SetLocalInt(GetModule(), "HX_SENSAI_AMULET", 1);
      AssignCommand(oUser, ClearAllActions(TRUE));
      DelayCommand(fDelay, AssignCommand(oUser, ActionStartConversation(oUser, "q4a_morph_conv", TRUE, FALSE)));
   }

   // Ring pieces to form the ring.
   if(GetTag(oItem) == "hx_ringpiece_1" || GetTag(oItem) == "hx_ringpiece_2" || GetTag(oItem) == "hx_ringpiece_3")
   {
      AssignCommand(oUser, ClearAllActions(TRUE));
      AssignCommand(oUser, ActionStartConversation(oUser, "hx_ring_conv", TRUE));
   }



   // Velox leaves that heal and regenerate the target.
   // If the user is a Ranger or a Druid, the healing
   // will be for more hps.
   if(GetTag(oItem) == "q4a_heal_leaves") {
      // Heal 1-20 hps.
      int iHeal = Random(30) + 1;
      int iRegen = 2;

      if(GetClassByPosition(1, oUser) == CLASS_TYPE_DRUID ||
         GetClassByPosition(2, oUser) == CLASS_TYPE_DRUID ||
         GetClassByPosition(3, oUser) == CLASS_TYPE_DRUID ||
         GetClassByPosition(1, oUser) == CLASS_TYPE_RANGER ||
         GetClassByPosition(2, oUser) == CLASS_TYPE_RANGER ||
         GetClassByPosition(3, oUser) == CLASS_TYPE_RANGER) {
         // Double the heal for Rangers and Druids. Make the
         // regen for more as well.
         iHeal = iHeal * 2;
         iRegen = iRegen + 2;
      }
      if(oTarget != oFountain) {
      DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect
                  (VFX_IMP_HEALING_L), oTarget));
      DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal
                  (iHeal), oTarget));
      DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectRegenerate
                  (iRegen, 20.0), oTarget, 120.0));
      }
      // Check to see if the target is the Magic Fountain.
      if(oTarget == oFountain && iMagic == 0) {
         // Set the fountain to the "magic" state.
         DelayCommand(0.4, SetLocalInt(oFountain, "magic", 1));
         DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_NATURES_BALANCE), oTarget));
         // Set an int to know this has been done.  Also update the journal.
         SetLocalInt(oUser, "mine_quest", 1);
         AddJournalQuestEntry("q4a_bessy_j", 20, oUser, TRUE);
         // Only make 1 set of sparks.
         if(GetObjectByTag("q4a_sparks") == OBJECT_INVALID)
            DelayCommand(0.8, DelayCreateObject(OBJECT_TYPE_PLACEABLE, "q4a_sparks", lLoc));
      }
      // If it is the fountain, but has been used, let the PC know, and give them
      // back the leaf.
      else if(oTarget == oFountain && iMagic == 1) {
         CreateItemOnObject(sRes, oUser, 1);
         //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] A leaf has already been used on the fountain.");
      }
      // Give the user feedback, different depending on the target.
      else if(oUser == oTarget)
      {
         //SendMessageToPC(oTarget, "[NOT IN STRING EDITOR] You use a Velox Leaf on yourself.");
      }
      else {
         //SendMessageToPC(oTarget, GetName(oUser) + " uses a Velox Leaf on you. [NOT IN STRING EDITOR]");
         //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You use a Velox Leaf on " + GetName(oTarget));
      }
   }

   // The Water Mold. When used it will create Sponge Spores on the user.
   if(GetTag(oItem) == "q4a_water_mold") {
      CreateItemOnObject("q4a_water_breath", oUser, 1);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_POISON_S), oUser);
      //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You break off some Sponge Spores from the Water Mold.");
   }

   // The Sponge Spores.  When used, it creates an effect on the user to portray
   // water breathing. During this time, the user can use the water pools for transit.
   if(GetTag(oItem) == "q4a_water_breath") {
      // Check to see if the user has water breathing on already. If so, create
      // the item back on them.
      if(GetLocalInt(oUser, "q4a_water_breath") == 1) {
         //SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You must wait before eating these Sponge Spores");
         CreateItemOnObject("q4a_water_breath", oUser, 1);
      }
      else {
         SetLocalInt(oUser, "q4a_water_breath", 1);
         // After 10 seconds the effect wears off.
         DelayCommand(20.0, SetLocalInt(oUser, "q4a_water_breath", 0));
         //DelayCommand(20.0, SendMessageToPC(oUser, "[NOT IN STRING EDITOR] Your breath returns."));

         // Effects on the user, plus feedback.
         //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), oUser, 20.0);
         SendMessageToPC(oUser, "[NOT IN STRING EDITOR] You feel your breath slip away.");
      }
   }

//////////////////////////////////////////////////////////////////////////////////
// OnActivate script for the grappling hand. When used, it will calculate a vector
// point that is 20.0 meters away (easily changed in fDist).  Corrective measures
// were taken to get accurate facings and target points. Targets can be any objects
// that have a tag of "grapple_target".
//
// To use, the PC stands facing a "target" and uses the item.  If they are in range,
// it will grab the closest target that is not "too" close.  We don't want them to
// grapple to a target that is right in front of them. It will then pull them across
// to their new location.
//
// This is very useful for putting hidden areas in your levels, that can only be
// accessed by grappling.
//
// The grappling hand can also activate items from a distance.  In this case, there
// are gongs that need to be rung in a certain order to get out of the dungeon. These
// gongs cannot be reached by normal means.
//
// The grappling hand can also be used to pull some items to the user, such as treasure
// chests.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////

   object oActivator = GetItemActivator();
   object oItemX = GetItemActivated();

// Grappling Hand
   if(GetTag(oItemX) == "dly_lore_grapple_hook") {
     //if(GetLocalInt(OBJECT_SELF, "HX_GRAPPLE_IN_USE") == 0)
     //{
     // SetLocalInt(OBJECT_SELF, "HX_GRAPPLE_IN_USE", 1);
      DelayCommand(4.0, SetLocalInt(OBJECT_SELF, "HX_GRAPPLE_IN_USE", 0));
      float fFacing = GetFacing(oActivator);
      float fNewFacing;
      float x, y;
      // This is the meter range of the Grappling Hand.
      float fDist = 20.0;
      vector vPC = GetPosition(oActivator);
      vector vTarget;
      location lTarget;
      // Final target for the grappling hand.
      object oFinalPillar;
      // Tags will be used for item creation if the grapple hand is pulling an item
      // to its owner.
      string sItemTag;
      string sSubTag;

      x = 0.0;
      y = 0.0;

      // Adjusted distances and facings.
      if(fFacing >= 22.5 && fFacing < 67.5){
         fNewFacing = 45.0;
         x = fDist;
         y = fDist;
      }
      else if(fFacing >= 67.5 && fFacing < 112.5){
         fNewFacing = 90.0;
         x = 0.0;
         y = fDist;
      }
      else if(fFacing >= 112.5 && fFacing < 157.5){
         fNewFacing = 135.0;
         x = (-fDist);
         y = fDist;
      }
      else if(fFacing >= 157.5 && fFacing < 202.5){
         fNewFacing = 180.0;
         x = (-fDist);
         y = 0.0;
      }
      else if(fFacing >= 202.5 && fFacing < 247.5){
         fNewFacing = 225.0;
         x = (-fDist);
         y = (-fDist);
      }
      else if(fFacing >= 247.5 && fFacing < 292.5){
         fNewFacing = 270.0;
         x = 0.0;
         y = (-fDist);
      }
      else if(fFacing >= 292.5 && fFacing < 337.5){
         fNewFacing = 315.0;
         x = fDist;
         y = (-fDist);
      }
      else {
         fNewFacing = 0.0;
         x = fDist;
         y = 0.0;
      }

     // Give feedback that the item has been thrown out to look for a target.
     //DelayCommand(0.1, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The Demonic Grappling Hand has been thrown into the distance.", oActivator, TRUE));
     DelayCommand(0.1, FloatingTextStrRefOnCreature(85527, oActivator, TRUE));
     // Reset the PC so we can see if they got a target or not.
     SetLocalInt(oActivator, "grapple_target", 0);

     vTarget = Vector(vPC.x + x, vPC.y + y);
     lTarget = Location(GetArea(oActivator), vTarget, fFacing);
     object oPillar = GetFirstObjectInShape(SHAPE_CONE, 5.0, lTarget, FALSE,
                      OBJECT_TYPE_PLACEABLE, vPC);

     while(oPillar != OBJECT_INVALID) {
        sItemTag = GetTag(oPillar);
        sSubTag = GetStringLeft(sItemTag, 9);

        if(( sItemTag == "hx_mimic_enemy" || sItemTag == "hx_floor_lev" || sItemTag == "hx_grap_item_break" || sItemTag == "grapple_target" || sSubTag == "grap_gong" || sSubTag == "grap_item")
           && (GetDistanceBetween(oActivator, oPillar) > 6.0 &&
           GetDistanceBetween(oActivator, oPillar) <= fDist)){

            // See which of the targets available is the best distance for the Grapple Hand.
           if(GetDistanceBetween(oActivator, oFinalPillar) == 0.0)
              oFinalPillar = oPillar;
           else if(GetDistanceBetween(oActivator, oFinalPillar) >
              GetDistanceBetween(oActivator, oPillar))
              oFinalPillar = oPillar;
        }
     oPillar = GetNextObjectInShape(SHAPE_CONE, 5.0, lTarget, FALSE,
               OBJECT_TYPE_PLACEABLE, vPC);
     }

     // Set the PC to a target acquired state for chain, gong, or item.
     sItemTag = GetTag(oFinalPillar);
     sSubTag = GetStringLeft(sItemTag, 9);

     if(sItemTag == "grapple_target")
        SetLocalInt(oActivator, "grapple_target", 1);
     else if(sSubTag == "grap_gong")
        SetLocalInt(oActivator, "grapple_target", 2);
     else if(sSubTag == "grap_item")
        SetLocalInt(oActivator, "grapple_target", 3);
     if(sItemTag == "hx_grap_item_break")
        SetLocalInt(oActivator, "grapple_target", 4);
     if(sItemTag == "hx_floor_lev")
        SetLocalInt(oActivator, "grapple_target", 5);
     if(sItemTag == "hx_floor_lev")
        SetLocalInt(oActivator, "hx_mimic_enemy", 6);
     // If we found a target, play the spell effects and teleport the PC to their new
     // location. Set their facing to face the object they are grappling to, then
     // set their facing to face the right way when they land. This is done so that
     // the player is not disoriented when they land.  Otherwise, tell them there
     // was no target.
     if(GetLocalInt(oActivator, "grapple_target") == 1) {
         AssignCommand(oActivator, SetFacingPoint(GetPosition(oFinalPillar)));
         //DelayCommand(0.8, AssignCommand(oActivator, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_FIRE_LASH), oFinalPillar, 1.5)));
         DelayCommand(0.8, AssignCommand(oActivator, ActionCastSpellAtObject(793, oFinalPillar, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
        //DelayCommand(1.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(475), oFinalPillar));
         DelayCommand(2.4, AllJumpToLocation(oActivator, GetLocation(oFinalPillar)));
         DelayCommand(2.6, AssignCommand(oActivator, SetFacing(fNewFacing)));
         //DelayCommand(3.2, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The Demonic Grappling Hand returns to your backpack.", oActivator, TRUE));
         DelayCommand(3.2, FloatingTextStrRefOnCreature(85528, oActivator, TRUE));
         return;
     }
     else if(GetLocalInt(oActivator, "grapple_target") == 2) {
         AssignCommand(oActivator, SetFacingPoint(GetPosition(oFinalPillar)));
         //DelayCommand(0.8, AssignCommand(oActivator, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_FIRE_LASH), oFinalPillar, 1.5)));
         DelayCommand(0.8, AssignCommand(oActivator, ActionCastSpellAtObject(793, oFinalPillar, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
         DelayCommand(1.7, CheckGong(oActivator, GetTag(oFinalPillar)));
         //DelayCommand(3.2, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The Demonic Grappling Hand returns to your backpack.", oActivator, TRUE));
         DelayCommand(3.2, FloatingTextStrRefOnCreature(85528, oActivator, TRUE));
         return;
     }
     else if(GetLocalInt(oActivator, "grapple_target") == 3) {
         AssignCommand(oActivator, SetFacingPoint(GetPosition(oFinalPillar)));
         //DelayCommand(0.8, AssignCommand(oActivator, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_FIRE_LASH), oFinalPillar, 1.3)));
         DelayCommand(0.8, AssignCommand(oActivator, ActionCastSpellAtObject(793, oFinalPillar, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
         DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oFinalPillar));
         DelayCommand(2.6, MakeItem(GetLocation(oActivator), GetTag(oFinalPillar), oActivator));
         //DelayCommand(3.2, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The Demonic Grappling Hand has pulled something to you.", oActivator, TRUE));
         DelayCommand(3.2, FloatingTextStrRefOnCreature(85529, oActivator, TRUE));
         return;
     }
     else if(GetLocalInt(oActivator, "grapple_target") == 4)
     {
         AssignCommand(oActivator, SetFacingPoint(GetPosition(oFinalPillar)));
         //DelayCommand(0.8, AssignCommand(oActivator, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_FIRE_LASH), oFinalPillar, 1.5)));
         DelayCommand(0.8, AssignCommand(oActivator, ActionCastSpellAtObject(793, oFinalPillar, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
         DelayCommand(2.0, BreakItem(oFinalPillar, oActivator));
         //DelayCommand(3.2, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The Demonic Grappling Hand returns to your backpack.", oActivator, TRUE));
         DelayCommand(3.2, FloatingTextStrRefOnCreature(85528, oActivator, TRUE));
         return;
     }
      else if(GetLocalInt(oActivator, "grapple_target") == 5)
     {
         AssignCommand(oActivator, SetFacingPoint(GetPosition(oFinalPillar)));
         //DelayCommand(0.8, AssignCommand(oActivator, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_FIRE_LASH), oFinalPillar, 1.5)));
         //DelayCommand(0.8, AssignCommand(oActivator, ActionCastSpellAtObject(793, oFinalPillar, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
         //DelayCommand(2.0, BreakItem(oFinalPillar, oActivator));
         //DelayCommand(3.2, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The Demonic Grappling Hand cannot get a grip on the lever.", oActivator, TRUE));
         DelayCommand(3.2, FloatingTextStrRefOnCreature(85530, oActivator, TRUE));
         return;
     }
     // Rats - possibly do later.
     else if(GetLocalInt(oActivator, "grapple_target") == 6)
     {
         AssignCommand(oActivator, SetFacingPoint(GetPosition(oFinalPillar)));
         //DelayCommand(0.8, AssignCommand(oActivator, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_FIRE_LASH), oFinalPillar, 1.5)));
         //DelayCommand(0.8, AssignCommand(oActivator, ActionCastSpellAtObject(793, oFinalPillar, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
         //DelayCommand(2.0, BreakItem(oFinalPillar, oActivator));
         //DelayCommand(3.2, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The Demonic Grappling Hand cannot get a grip on the lever.", oActivator, TRUE));
         DelayCommand(3.2, FloatingTextStrRefOnCreature(85530, oActivator, TRUE));
         return;
     }
     else
         //DelayCommand(3.2, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] The Demonic Grappling Hand returns with no target.", oActivator, TRUE));
         DelayCommand(3.2, FloatingTextStrRefOnCreature(85531, oActivator, TRUE));
   }
   //}
   //else
   //  DelayCommand(0.0, FloatingTextStringOnCreature("[NOT IN STRING EDITOR] You must wait before using The Demonic Grappling Hand again.", oActivator, TRUE));
}


// This function will check to see if the PC has done the gong puzzle in the correct order.
// Upon doing so, the portal out will be activated.  If any are done out of order,
// the gongs will reset.
void CheckGong(object oActivator, string sGong) {
   object oPortal = GetObjectByTag("end_portal");
   location lPortal = GetLocation(oPortal);
   int iGongPattern = GetLocalInt(GetArea(oActivator), "gong");
   string sID = GetStringRight(sGong, 1);
   object oSound = GetObjectByTag("gongsound_" + sID);

   SoundObjectPlay(oSound);
   //Restart the background music
   DelayCommand(3.8, SoundObjectStop(oSound));
   DelayCommand(10.1, MusicBackgroundPlay(GetArea(oActivator)));

   if(GetLocalInt(GetArea(oActivator), "gong_statue_done") == 1) {
      if(iGongPattern == 2 && GetTag(oSound) == "gongsound_3")
         SetLocalInt(GetArea(oActivator), "gong", 3);
      else if(iGongPattern == 1 && GetTag(oSound) == "gongsound_2")
         SetLocalInt(GetArea(oActivator), "gong", 2);
      else if(iGongPattern == 0 && GetTag(oSound) == "gongsound_1")
         SetLocalInt(GetArea(oActivator), "gong", 1);
      else
         SetLocalInt(GetArea(oActivator), "gong", 0);
   }

   // If they have done the correct pattern (mid, high, low), activate the portal.
   // Then reset it after 10 minutes.
   if(GetLocalInt(GetArea(oActivator), "gong") == 3) {
      object oInvis = GetObjectByTag("portal_invis");
      location lInvis = GetLocation(oInvis);

      DelayCommand(1.0, AssignCommand(oActivator, SetFacingPoint(GetPosition(oInvis))));
      DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), lInvis));
      DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUNBEAM), lInvis));
      DelayCommand(5.0, DelayCreateObject(OBJECT_TYPE_PLACEABLE, "end_portal", lInvis));
      DelayCommand(6.8, AssignCommand(oActivator, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1)));
      DelayCommand(7.0, AssignCommand(oActivator, PlayVoiceChat(VOICE_CHAT_CHEER, OBJECT_SELF)));
      DelayCommand(8.0, AddJournalQuestEntry("q4a_gargs", 60, oActivator, TRUE, TRUE));
      //Give non-repeatable XP
      object oPC = oActivator;
      int i2daRow = 125;
      int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
      if (bDuplicate == FALSE)
      {
          SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
          DelayCommand(8.0, Reward_2daXP(oPC, i2daRow));
      }
      //DelayCommand(600.0, DestroyObject(GetObjectByTag("end_portal")));
   }
}

// Break the item the hand hits.
void BreakItem(object oObject, object oActivator)
{
    object oCast = GetObjectByTag("hx_puzzle_sphere");
    object oCast2 = GetObjectByTag("hx_puzzle_sphere2");
    int iTimes = GetLocalInt(GetArea(oObject), "HX_SPHERE_PRISON");
    location lLoc = GetLocation(GetNearestObjectByTag("hx_sphere_effect_wp", oObject));
    object oSound = GetObjectByTag("hx_anchor_break_sound");
    object oObject2 = GetNearestObjectByTag("hx_grap_item_break2", oObject);

    SetPlotFlag(oObject, FALSE);
    SoundObjectPlay(oSound);
    AssignCommand(oSound, DelayCommand(2.0, SoundObjectStop(oSound)));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lLoc);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), lLoc);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oObject2);
    SetLocalInt(GetArea(oObject), "HX_SPHERE_PRISON", iTimes + 1);

    // If 4, break globe.
    if(iTimes + 1 >= 4)
    {
        SignalEvent(oCast2, EventUserDefined(4444));
        DestroyObject(oCast);
        DelayCommand(0.5, AddJournalQuestEntry("hx_prisoner", 20, oActivator, TRUE, TRUE));
        //Give non-repeatable XP
        object oPC = oActivator;
        int i2daRow = 117;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            DelayCommand(0.5, Reward_2daXP(oPC, i2daRow));
        }
    }
    DestroyObject(oObject, 1.0);
    DestroyObject(oObject2, 1.0);
}

// Make the item that was pulled.  Destroy the original one (and its contents).
void MakeItem(location lLoc, string sItem, object oActivator) {
   object oObject = GetNearestObjectByTag(sItem, oActivator);
   object oItem = GetFirstItemInInventory(oObject);
   string sTag = GetTag(oObject);
   string sRes = GetResRef(oObject);

   if(oObject != OBJECT_INVALID)
      if(sTag == "grap_item_chest") {
         while(oItem != OBJECT_INVALID) {
            DestroyObject(oItem);
         oItem = GetNextItemInInventory(oObject);
         }
      }
      DestroyObject(oObject, 0.5);
   PlaySound("it_genericmedium");
   CreateObject(OBJECT_TYPE_PLACEABLE, sRes, lLoc);
}

// Delayed create for any types.
void DelayCreateObject(int iType, string sRes, location lLoc) {
   CreateObject(iType, sRes, lLoc);
}

// Jump PC and associates.
void AllJumpToLocation(object oObject, location lLoc)
{
    AssignCommand(oObject, ClearAllActions(TRUE));
    AssignCommand(oObject, ActionJumpToLocation(lLoc));

    object oPartyMember = GetFirstFactionMember(oObject, FALSE);
    while(GetIsObjectValid(oPartyMember))
    {
        if(oPartyMember != oObject)
        {
            AssignCommand(oPartyMember, ClearAllActions(TRUE));
            DelayCommand(0.1, AssignCommand(oPartyMember, ActionJumpToLocation(lLoc)));
        }
        oPartyMember = GetNextFactionMember(oObject, FALSE);
    }
/*
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    AssignCommand(oObject, ClearAllActions(TRUE));
    AssignCommand(oObject, ActionJumpToLocation(lLoc));

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oHench1, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oHench2, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oHench3, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oAssoc1, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oAssoc2, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oAssoc3, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oAssoc4, ActionJumpToLocation(lLoc)));
    }
*/
}
