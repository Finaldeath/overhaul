//::///////////////////////////////////////////////
//:: Name hx_gen_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is the generic onenter script for "ring
     vision" areas.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
// Standard cutscene start
void StartCutscene(object oPC, int iCut);
// A few commands linked together for the dead that Meph raises.
void RaiseDead(int iCut, object oDead, object oMeph);
// Change Track based on night.
void SetMusic(int iCut, object oPC);
// Have the horde walk towards camera.
void DoEndWalk(int iCut, object oDead);
// Day/Night switch
void DoDayToNight(int iCut, object oPC, float fTime = 14.0);
// Play sound object.
void CutPlaySoundObject(int iCut, object oSound);
// Activate cutscene for Associates.
void ActivateAssociates(object oObject, int iCut);
// Clear effects.
void ClearAllEffects();
// Clear all the player's associates.
void ClearParty(object oObject, int iCut);
// Jump henchmen.
void JumpHenchmen(object oObject);

void main()
{
    object oPC = GetEnteringObject();
    int iCut = 205;

    if(GetIsPC(oPC))
    {
        BlackScreen(oPC);
        DelayCommand(0.5, JumpHenchmen(oPC));
        DelayCommand(1.0, StartCutscene(oPC, iCut));
    }
}

void StartCutscene(object oPC, int iCut)
{
      SetCutsceneMode(oPC, TRUE);
      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

      // Cutscene objects other than the PC.
      object oMeph = GetNearestObjectByTag("hx_meph_crystal", oPC);
      CutSetActiveCutsceneForObject(oMeph, iCut);
      object oDead1 = GetObjectByTag("hx_crystal1_1");
      CutSetActiveCutsceneForObject(oDead1, iCut);
      object oDead2 = GetObjectByTag("hx_crystal1_2");
      CutSetActiveCutsceneForObject(oDead2, iCut);
      object oDead3 = GetObjectByTag("hx_crystal1_3");
      CutSetActiveCutsceneForObject(oDead3, iCut);
      object oDead4 = GetObjectByTag("hx_crystal1_4");
      CutSetActiveCutsceneForObject(oDead4, iCut);
      object oDead5 = GetObjectByTag("hx_crystal1_5");
      CutSetActiveCutsceneForObject(oDead5, iCut);
      object oDead6 = GetObjectByTag("hx_crystal1_6");
      CutSetActiveCutsceneForObject(oDead6, iCut);
      object oDead7 = GetObjectByTag("hx_crystal1_7");
      CutSetActiveCutsceneForObject(oDead7, iCut);
      object oDead8 = GetObjectByTag("hx_crystal1_8");
      CutSetActiveCutsceneForObject(oDead8, iCut);
      object oDead9 = GetObjectByTag("hx_crystal1_9");
      CutSetActiveCutsceneForObject(oDead9, iCut);
      object oDead10 = GetObjectByTag("hx_crystal1_10");
      CutSetActiveCutsceneForObject(oDead10, iCut);
      object oDead11 = GetObjectByTag("hx_crystal1_11");
      CutSetActiveCutsceneForObject(oDead11, iCut);
      object oDead12 = GetObjectByTag("hx_crystal1_12");
      CutSetActiveCutsceneForObject(oDead12, iCut);
      object oDead13 = GetObjectByTag("hx_crystal1_13");
      CutSetActiveCutsceneForObject(oDead13, iCut);
      object oDead14 = GetObjectByTag("hx_crystal1_14");
      CutSetActiveCutsceneForObject(oDead14, iCut);
      object oDead15 = GetObjectByTag("hx_crystal1_15");
      CutSetActiveCutsceneForObject(oDead15, iCut);
      object oDead16 = GetObjectByTag("hx_crystal1_16");
      CutSetActiveCutsceneForObject(oDead16, iCut);
      object oDead17 = GetObjectByTag("hx_crystal1_17");
      CutSetActiveCutsceneForObject(oDead17, iCut);
      object oDead18 = GetObjectByTag("hx_crystal1_18");
      CutSetActiveCutsceneForObject(oDead18, iCut);
      object oDead19 = GetObjectByTag("hx_crystal1_19");
      CutSetActiveCutsceneForObject(oDead19, iCut);
      object oDead20 = GetObjectByTag("hx_crystal1_20");
      CutSetActiveCutsceneForObject(oDead20, iCut);
      object oSound = GetObjectByTag("hx_death_sound");
      CutSetActiveCutsceneForObject(oSound, iCut);
      object oSound2 = GetObjectByTag("hx_death_sound2");
      CutSetActiveCutsceneForObject(oSound2, iCut);
      object oCrystal = GetObjectByTag("hx_crystal_1");
      CutSetActiveCutsceneForObject(oCrystal, iCut);

      // Waypoints.
      location lPCStart = GetLocation(GetNearestObjectByTag("hx_crystal_pc_start_wp", oPC));
      location lPCJump = GetLocation(GetNearestObjectByTag("hx_crystal_pc_jump_wp", oPC));
      location lMephEnd = GetLocation(GetNearestObjectByTag("hx_crystal_meph_end_wp", oPC));
      location lMephEnd2 = GetLocation(GetNearestObjectByTag("hx_crystal_meph_end_wp2", oPC));
      location lLoc = GetLocation(oMeph);

      // Setup the cutscene.
      DelayCommand(9.0, DoDayToNight(iCut, oPC));
      //CutBlackScreen(0.0, oPC);
      CutFadeOutAndIn(0.0, oPC, 3.0);
      DelayCommand(0.5, ActivateAssociates(oPC, iCut));
      CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH, TRUE);

      CutSetCamera(2.4, oPC, CAMERA_MODE_TOP_DOWN, 305.0, 5.0, 80.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(2.2, oPC, lPCStart);

      //CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);

      // Start the scene.
      CutSetCamera(4.5, oPC, CAMERA_MODE_TOP_DOWN, 290.0, 1.0, 75.0,
                   CAMERA_TRANSITION_TYPE_SLOW);

      CutClearAllActions(6.3, oMeph, TRUE);
      CutActionMoveToLocation(6.5, oMeph, lMephEnd, FALSE);
      CutActionMoveToLocation(6.6, oMeph, lMephEnd, FALSE);
      CutActionMoveToLocation(6.7, oMeph, lMephEnd, FALSE);

      CutJumpToLocation(9.5, oPC, lPCJump);
      CutSetCamera(9.5, oPC, CAMERA_MODE_TOP_DOWN, 125.0, 1.0, 75.0,
                   CAMERA_TRANSITION_TYPE_SNAP);

      CutSetCamera(9.5, oPC, CAMERA_MODE_TOP_DOWN, 125.0, 19.0, 88.0,
                   CAMERA_TRANSITION_TYPE_MEDIUM);

      DelayCommand(12.4, SetMusic(iCut, oPC));
      // Raise the dead as he walks.
      DelayCommand(13.0, RaiseDead(iCut, oDead1, oMeph));
      DelayCommand(13.8, RaiseDead(iCut, oDead2, oMeph));
      DelayCommand(14.8, RaiseDead(iCut, oDead3, oMeph));
      DelayCommand(15.2, RaiseDead(iCut, oDead4, oMeph));
      DelayCommand(15.4, RaiseDead(iCut, oDead5, oMeph));
      DelayCommand(17.0, RaiseDead(iCut, oDead6, oMeph));
      DelayCommand(17.2, RaiseDead(iCut, oDead7, oMeph));
      DelayCommand(18.0, RaiseDead(iCut, oDead8, oMeph));
      DelayCommand(18.2, RaiseDead(iCut, oDead9, oMeph));
      DelayCommand(18.3, RaiseDead(iCut, oDead19, oMeph));
      DelayCommand(20.3, RaiseDead(iCut, oDead10, oMeph));
      DelayCommand(21.0, RaiseDead(iCut, oDead11, oMeph));
      DelayCommand(21.3, RaiseDead(iCut, oDead12, oMeph));
      DelayCommand(21.0, CutPlaySoundObject(iCut, oSound));
      DelayCommand(22.0, RaiseDead(iCut, oDead13, oMeph));
      DelayCommand(23.0, RaiseDead(iCut, oDead14, oMeph));
      DelayCommand(24.0, RaiseDead(iCut, oDead15, oMeph));
      DelayCommand(23.0, CutPlaySoundObject(iCut, oSound2));
      DelayCommand(24.2, RaiseDead(iCut, oDead16, oMeph));
      DelayCommand(24.7, RaiseDead(iCut, oDead17, oMeph));
      DelayCommand(25.0, CutPlaySoundObject(iCut, oSound));
      DelayCommand(25.0, RaiseDead(iCut, oDead18, oMeph));
      DelayCommand(23.2, RaiseDead(iCut, oDead20, oMeph));

      CutClearAllActions(26.1, oMeph, TRUE);
      // Ending of Meph looking back at his creations.
      CutPlayAnimation(26.9, oMeph, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 3.0);
      CutApplyEffectToObject(27.4, DURATION_TYPE_TEMPORARY, VFX_DUR_FREEZE_ANIMATION, oMeph, 1.5);
      CutSetCamera(25.3, oPC, CAMERA_MODE_TOP_DOWN, 123.0, 19.0, 100.0,
                   CAMERA_TRANSITION_TYPE_CRAWL);
      DelayCommand(26.1, DoEndWalk(iCut, oMeph));
      CutSetCamera(27.5, oPC, CAMERA_MODE_TOP_DOWN, 123.0, 1.0, 100.0,
                   CAMERA_TRANSITION_TYPE_FAST);
      // End scene.
      CutFadeOutAndIn(32.0, oPC, 1.5);
      CutJumpToObject(33.3, oPC, oCrystal);
      DelayCommand(33.0, ClearParty(oPC, iCut));
      CutDisableCutscene(iCut, 33.5, 33.5, RESTORE_TYPE_NONE);
}

// A few commands linked together for the dead that Meph raises.
void RaiseDead(int iCut, object oDead, object oMeph)
{
    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH), oDead);
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oDead));
        //DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(479), oDead));
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_GREY), oDead));
        DelayCommand(1.8, AssignCommand(oDead, SetFacingPoint(GetPosition(oMeph))));
    }
}

void SetMusic(int iCut, object oPC)
{
    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        object oArea = GetArea(oPC);
        int iTrack = MusicBackgroundGetNightTrack(oArea);
        MusicBackgroundStop(oArea);
        MusicBackgroundChangeDay(oArea, iTrack);
        MusicBackgroundPlay(oArea);
    }
}

void DoEndWalk(int iCut, object oMeph)
{
    if(iCut == GetLocalInt(oMeph, "nCutsceneNumber"))
    {
        int x = 1;
        object oDead = GetNearestObject(OBJECT_TYPE_CREATURE, oMeph, x);
        string sDead;
        object oWP;
        float fDelay = 0.0;

        while(GetIsObjectValid(oDead))
        {
            sDead = GetTag(oDead);
            if(GetStringLeft(sDead, 11) == "hx_crystal1")
            {
                //oWP = GetNearestObjectByTag("hx_crystal_undead_walk_wp", oDead);
                //AssignCommand(oDead, ActionMoveToObject(oWP));
                DelayCommand(fDelay, AssignCommand(oDead, PlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 10.0)));
            }
            x = x + 1;
            fDelay = fDelay + 0.09;
            oDead = GetNearestObject(OBJECT_TYPE_CREATURE, oMeph, x);
        }
    }
}

void DoDayToNight(int iCut, object oPC, float fTime = 14.0)
{
     if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
     {
        DayToNight(oPC, fTime);
     }
}

// Play sound object.
void CutPlaySoundObject(int iCut, object oSound)
{
    if(iCut == GetLocalInt(oSound, "nCutsceneNumber"))
    {
       SoundObjectPlay(oSound);
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
            DestroyObject(oAssoc4);
            //CutSetActiveCutsceneForObject(oAssoc4, iCut);
            //CutApplyEffectToObject(0.1, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oAssoc4);
            //CutApplyEffectToObject2(0.2, DURATION_TYPE_PERMANENT, EffectCutsceneGhost(), oAssoc4);
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

// Jump associates.
void JumpHenchmen(object oObject)
{
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    location lLoc = GetLocation(GetObjectByTag("hx_crystal1_hench_jump_wp"));

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllActions());
        AssignCommand(oHench1, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllActions());
        AssignCommand(oHench2, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllActions());
        AssignCommand(oHench3, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllActions());
        AssignCommand(oAssoc1, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllActions());
        AssignCommand(oAssoc2, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllActions());
        AssignCommand(oAssoc3, ActionJumpToLocation(lLoc));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllActions());
        AssignCommand(oAssoc4, ActionJumpToLocation(lLoc));
    }
}
