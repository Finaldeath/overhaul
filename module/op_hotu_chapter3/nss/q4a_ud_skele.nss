//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q4a_ud_skele
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will have the dead skeleton cast
     a spell at the nearest Bone Golem maker.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 16, 2003
//:://////////////////////////////////////////////
void MakeObject(int iType, string sRes, location lLoc);
void MakeSkeleton (object oSkeleton, object oGolem, location lLocation);
void MakeGolem();
void DoCleanup();
void RemoveEffects(object oObject);

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
       // The 4 invis Golem makers.
       object oGolem1 = GetObjectByTag("q4a_golem_invis1");
       object oGolem2 = GetObjectByTag("q4a_golem_invis2");
       object oGolem3 = GetObjectByTag("q4a_golem_invis3");
       object oGolem4 = GetObjectByTag("q4a_golem_invis4");

       // The dead object (self).
       object oSkeleton = OBJECT_SELF;
       location lLoc = GetLocation(oSkeleton);

       // Create a floating location for the bones placeables.
       float fFacing1 = GetFacing(oGolem1);
       vector vGolem1 = GetPosition(oGolem1);
       vector vTarget1 = Vector(vGolem1.x, vGolem1.y, vGolem1.z + 1.1);
       location lLoc1 = Location(GetArea(oGolem1), vTarget1, fFacing1);

       float fFacing2 = GetFacing(oGolem2);
       vector vGolem2 = GetPosition(oGolem2);
       vector vTarget2 = Vector(vGolem2.x, vGolem2.y, vGolem2.z + 1.1);
       location lLoc2 = Location(GetArea(oGolem2), vTarget2, fFacing2);

       float fFacing3 = GetFacing(oGolem3);
       vector vGolem3 = GetPosition(oGolem3);
       vector vTarget3 = Vector(vGolem3.x, vGolem3.y, vGolem3.z + 1.1);
       location lLoc3 = Location(GetArea(oGolem3), vTarget3, fFacing3);

       float fFacing4 = GetFacing(oGolem4);
       vector vGolem4 = GetPosition(oGolem4);
       vector vTarget4 = Vector(vGolem4.x, vGolem4.y, vGolem4.z + 1.1);
       location lLoc4 = Location(GetArea(oGolem4), vTarget4, fFacing4);

       // Check to see where we need to make the bones.  Go in order from
       // 1 to 4, but if it is the 4th being made, destroy all the bones
       // and light shafts, and clear the effects on the invis golems.
       //
       // Store all the ints on invis_golem1, so do the checks there as well.
       if(GetLocalInt(oGolem1, "q4a_golem_ready") == 0) {
          SetLocalInt(oGolem1, "q4a_golem_ready", 1);
          MakeSkeleton(OBJECT_SELF, oGolem1, lLoc1);
       }
       else if(GetLocalInt(oGolem1, "q4a_golem_ready") == 1) {
          SetLocalInt(oGolem1, "q4a_golem_ready", 2);
          MakeSkeleton(OBJECT_SELF, oGolem2, lLoc2);
       }
       else if(GetLocalInt(oGolem1, "q4a_golem_ready") == 2) {
          SetLocalInt(oGolem1, "q4a_golem_ready", 3);
          MakeSkeleton(OBJECT_SELF, oGolem3, lLoc3);
       }
       else {
          SetLocalInt(oGolem1, "q4a_golem_ready", 0);
          MakeSkeleton(OBJECT_SELF, oGolem4, lLoc4);
          // Set an int on the invis object that is keeping track of
          // skeles so that it stops making them temporarily.
          SetLocalInt(GetObjectByTag("q4a_counter"), "q4a_ready", 1);
          MakeGolem();
       }

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

// Delayed create object.
void MakeObject(int iType, string sRes, location lLoc) {
   CreateObject(iType, sRes, lLoc);
}

// Make the skeleton bones.
void MakeSkeleton (object oSkeleton, object oGolem, location lLocation) {
   location lLoc1 = GetLocation(oSkeleton);
   location lLoc2 = GetLocation(oGolem);

   SetPlotFlag(oSkeleton, 0);

   DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                EffectVisualEffect(VFX_IMP_RAISE_DEAD), oSkeleton));
   DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                EffectVisualEffect(VFX_IMP_RAISE_DEAD), oGolem));

   DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                EffectVisualEffect(VFX_IMP_DEATH), oSkeleton));
   DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                EffectVisualEffect(VFX_IMP_DEATH), oGolem));

   // Get rid of the real skeleton corpse.
   DelayCommand(11.0, AssignCommand(oSkeleton, SetIsDestroyable(TRUE, FALSE, FALSE)));
   DelayCommand(11.5, DestroyObject(oSkeleton));
   DelayCommand(4.0, MakeObject(OBJECT_TYPE_PLACEABLE, "q4a_bones", lLocation));
   DelayCommand(2.0, MakeObject(OBJECT_TYPE_PLACEABLE, "q4a_skele_light", GetLocation(oGolem)));
   DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE), oGolem));
}

// Make the Golem if the 4 bone fragments have been made. Cleanup after.
void MakeGolem() {
   // The 4 gargoyle statues.
    object oGarg1 = GetObjectByTag("q4a_garg_skele1");
    object oGarg2 = GetObjectByTag("q4a_garg_skele2");
    object oGarg3 = GetObjectByTag("q4a_garg_skele3");
    object oGarg4 = GetObjectByTag("q4a_garg_skele4x");
    // Golem spawn point.
    object oSpawn = GetObjectByTag("q4a_spawn_point");
    location lSpawn = GetLocation(oSpawn);

    // Sound effect.
    object oSound = GetObjectByTag("hx_ring_strike_sound");

    // The invis target that will be the center point for thr
    // garg statues when they fire.
    object oTarget = GetObjectByTag("q4a_garg_targ");

    // Make lightning shoot from the gargoyles to the center, then
    // have a Bone Golem appear in the center. Apply effects to all
    // areas.
    DelayCommand(3.9, SoundObjectPlay(oSound));
    DelayCommand(8.0, SoundObjectStop(oSound));
    DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oGarg1));
    //DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oGarg1));
    //DelayCommand(4.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oGarg2));
    //DelayCommand(4.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oGarg3));
    //DelayCommand(4.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oGarg4));
    DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE), oGarg1, 6.0));
    DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE), oGarg2, 6.0));
    DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE), oGarg3, 6.0));
    DelayCommand(6.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE), oGarg4, 6.0));

    // Clean up all the objects.
    DelayCommand(4.1, DoCleanup());

    DelayCommand(6.0, AssignCommand(oGarg1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_LIGHTNING), oTarget, 2.0)));
    DelayCommand(6.0, AssignCommand(oGarg2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_SILENT_LIGHTNING), oTarget, 2.0)));
    DelayCommand(6.0, AssignCommand(oGarg3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_SILENT_LIGHTNING), oTarget, 2.0)));
    DelayCommand(6.0, AssignCommand(oGarg4, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_SILENT_LIGHTNING), oTarget, 2.0)));

    DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oSpawn));
    DelayCommand(8.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_BLINDDEAF), oSpawn));

    DelayCommand(9.2, MakeObject(OBJECT_TYPE_CREATURE, "q4a_bone_golem", lSpawn));
}

// Effects Removal.
void RemoveEffects(object oObject) {
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
       RemoveEffect(oObject, eEff);
       eEff = GetNextEffect(oObject);
    }
}

// Clean up.
void DoCleanup() {
    // The 4 invis Golem makers.
    object oGolem1 = GetObjectByTag("q4a_golem_invis1");
    object oGolem2 = GetObjectByTag("q4a_golem_invis2");
    object oGolem3 = GetObjectByTag("q4a_golem_invis3");
    object oGolem4 = GetObjectByTag("q4a_golem_invis4");

    // Remove the effects
    RemoveEffects(oGolem1);
    RemoveEffects(oGolem2);
    RemoveEffects(oGolem3);
    RemoveEffects(oGolem4);

    // Destroy the lights.
    int x = 0;
    object oObject = GetObjectByTag("q4a_skele_light", x);

    while(oObject != OBJECT_INVALID) {
       DestroyObject(oObject);
       x = x + 1;
       oObject = GetObjectByTag("q4a_skele_light", x);
    }

    // Destroy the bones.
    x = 0;
    oObject = GetObjectByTag("q4a_bones", x);

    while(oObject != OBJECT_INVALID) {
       DestroyObject(oObject);
       x = x + 1;
       oObject = GetObjectByTag("q4a_bones", x);
    }

}
