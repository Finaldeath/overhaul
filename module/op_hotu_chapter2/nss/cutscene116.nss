//::///////////////////////////////////////////////
//:: Name cutscene116
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This cutscene fires when the Matron is killed
    during the Zesyyr plot.

    Zesyyr and retinue will come in, scoff at the dead matron
    and talk to the PC...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 19/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"

void StartCutscene(object oPC);

int nCutsceneNumber = 116;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    object oPC = OBJECT_SELF;

    object oArea = GetArea(oPC);

    CutDisableAbort(nCutsceneNumber);
    //Change the ambient sound - battle is over
    //Change ambient sounds to battle sounds.
    //AmbientSoundChangeDay(oArea, 35);
    //AmbientSoundChangeNight(oArea, 35);
    //AmbientSoundPlay(oArea);

    //Set Cutscene 116 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);

    //All PCs in the area will Fade to Black
    //Set Cutscene mode on each player in the area and do the fade
    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
       AssignCommand(oPlayer, ClearAllActions(TRUE));
       //Fade PCs to black
       BlackScreen(oPlayer);

       if(oPlayer == oPC)
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);

       }
       else
       {
           CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
       }

       //CutDisableAbort(nCutsceneNumber);
       CutSetCutsceneMode(0.5, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc invis - keep associates

       CutFadeFromBlack(1.5, oPlayer, FADE_SPEED_FASTEST, FALSE);

       oPlayer = GetNextPC();
    }

    DelayCommand(1.5, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{

    // Cutscene actors and objects.
    object oSeer = GetObjectByTag("q2amaematron");
    DelayCommand(15.5, AssignCommand(oSeer, SetIsDestroyable(TRUE)));

    object oZesyyr = GetObjectByTag("q2amaezesyyr");
    object oZesGuard1 = GetObjectByTag("q2azesguard1");
    object oZesGuard2 = GetObjectByTag("q2azesguard2");
    object oGuard1 = GetObjectByTag("cut108_guard1");
    object oGuard2 = GetObjectByTag("cut108_guard2");
    object oGuard3 = GetObjectByTag("cut108_guard3");
    object oGuard4 = GetObjectByTag("cut108_guard4");


    CutSetActiveCutsceneForObject(oSeer, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oZesyyr, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oZesGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oZesGuard2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oGuard4, nCutsceneNumber);

    //locations
    object oGuard1_1 = GetWaypointByTag("cut116wp_guard1_1");
    object oGuard2_1 = GetWaypointByTag("cut116wp_guard2_1");
    object oGuard3_1 = GetWaypointByTag("cut116wp_guard3_1");
    object oGuard4_1 = GetWaypointByTag("cut116wp_guard4_1");

    object oZesStart = GetWaypointByTag("cut116wp_zesstart");

    //Camera waypoints

    location lCamera1 = GetLocation(GetWaypointByTag("cut116wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut116wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut116wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut116wp_camera3"));

    //Make a copy of the PC to move about

    location lStart = GetLocation(oPC);
    object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut116Copy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, TRUE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 16.0, 55.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(6.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);

    //CutSetCamera(15.0, oPC, CAMERA_MODE_TOP_DOWN, 75.0, 20.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutSetCamera(20.0, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 20.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //CutActionMoveToLocation(6.5, oPC, GetLocation(oImloth), TRUE, FALSE);

    CutActionMoveToLocation(6.0, oPC, lCamera2, FALSE, FALSE);
    //CutActionMoveToLocation(20.0, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //PC Cheers
    CutActionMoveToObject(0.0, oCopy, oSeer, FALSE, FALSE);
    CutPlayAnimation(3.0, oCopy, ANIMATION_FIREFORGET_VICTORY3, 3.0, FALSE);
    //Zesyyr and guards come in and walk to seer
    CutJumpToObject(3.0, oZesyyr, oZesStart);
    CutActionMoveToObject(3.5, oZesyyr, oSeer, FALSE, FALSE);
    CutJumpToObject(4.0, oZesGuard1, oZesStart);
    CutActionMoveToObject(4.5, oZesGuard1, oSeer, FALSE, FALSE);
    CutJumpToObject(5.0, oZesGuard2, oZesStart);
    CutActionMoveToObject(5.5, oZesGuard2, oSeer, FALSE, FALSE);

    //Other guards walk to Zesyyr and bow to her
    CutActionMoveToObject(6.0, oGuard1, oGuard1_1, FALSE, FALSE);
    CutActionMoveToObject(5.0, oGuard2, oGuard2_1, FALSE, FALSE);
    CutActionMoveToObject(7.0, oGuard3, oGuard3_1, FALSE, FALSE);
    CutActionMoveToObject(9.0, oGuard4, oGuard4_1, FALSE, FALSE);

    CutSetFacingPoint(10.0, oGuard1, "q2amaezesyyr", FALSE);
    CutPlayAnimation(11.0, oGuard1, ANIMATION_LOOPING_WORSHIP, 30.0, FALSE);

    CutSetFacingPoint(10.0, oGuard2, "q2amaezesyyr", FALSE);
    CutPlayAnimation(11.0, oGuard2, ANIMATION_LOOPING_WORSHIP, 30.0, FALSE);

    CutSetFacingPoint(11.0, oGuard3, "q2amaezesyyr", FALSE);
    CutPlayAnimation(11.0, oGuard3, ANIMATION_LOOPING_WORSHIP, 30.0, FALSE);

    CutSetFacingPoint(13.0, oGuard4, "q2amaezesyyr", FALSE);
    CutPlayAnimation(11.0, oGuard4, ANIMATION_LOOPING_WORSHIP, 30.0, FALSE);

    //Zesyyr spits on Seer's body
    CutSpeakStringByStrRef(12.0, oZesyyr, 85746, FALSE); //"Goodbye, mother."
    CutActionCastFakeSpellAtObject(13.0, SPELL_RAISE_DEAD, oZesyyr, oSeer);
    CutApplyEffectAtLocation(15.0, oZesyyr, DURATION_TYPE_INSTANT, VFX_IMP_DEATH, GetLocation(oSeer));
    CutDestroyObject(16.0, oSeer, FALSE);
    //Zesyyr talks to PC
    CutActionMoveToObject(17.0, oZesyyr, oCopy, FALSE);


    // End Cutscene

    CutFadeOutAndIn(20.5, oPC);


    //Clean up actors...

    //Start conversation with PC
    CutClearAllActions(20.8, oPC, TRUE, FALSE);
    CutActionStartConversation(21.0, oZesyyr, oPC, "q2azesyyrcut", FALSE);

    CutDisableCutscene(nCutsceneNumber, 21.5, 21.5, RESTORE_TYPE_NONE);

}


