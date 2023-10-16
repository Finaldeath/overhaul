//::///////////////////////////////////////////////
//:: Name q2c_ent_lev2cut
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene Script - Entering the Central area of
    Undermountain Level 2.
    PC will see drow chasing halaster's assistant
    into the central room.  When the door to the
    central area closes - a flash - all the chains
    for the chain puzzle will dissappear and the
    drow will yell out...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 24/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

void StartCutscene(object oPC);

int nCutsceneNumber = 39;

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPossessedFamiliar(oPC) == TRUE)
    {
        UnpossessFamiliar(oPC);
        return;
    }
    if (GetIsPC(oPC) == FALSE)
        return;

    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        object oArea = GetArea(OBJECT_SELF);

        string szArea = GetTag(oArea);

        //Set a local int on the area to show that cutscene 39 is running
        SetLocalInt(oArea, "X2_CutScene39", 1);

        //Set Cutscene 29 as active for all future calls to Cut_ commands
        CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);

        //All PCs in the area will Fade to Black


        //Set Cutscene mode on each player in the area and do the fade

        object oPlayer = GetFirstPC();
        while (oPlayer != OBJECT_INVALID)
        {
            //if (GetTag(GetArea(oPlayer)) == szArea)
            //{
                AssignCommand(oPlayer, ClearAllActions());
                if(oPlayer == oPC)
                {
                    CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);
                }
                else
                {
                    CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
                }

                //CutDisableAbort(nCutsceneNumber);
                CutSetCutsceneMode(1.0, oPlayer, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates
                CutFadeOutAndIn(0.0, oPlayer, 2.0);
            //}

            oPlayer = GetNextPC();
        }
        //SetPCLocation
        CutSetLocation(0.0, oPC, FALSE);
        DelayCommand(1.0, StartCutscene(oPC));


}

void StartCutscene(object oPC)
{


    // Cutscene actors and objects.

    object oAssistant = GetObjectByTag("cut39_assistant");
    object oDrow1 = GetObjectByTag("cut39_drow1");
    object oDrow2 = GetObjectByTag("cut39_drow2");
    object oDrow3 = GetObjectByTag("cut39_drow3");

    object oDoor = GetObjectByTag("q2c03_door");
    object oChain1 = GetObjectByTag("cut39_chain1");
    object oChain2 = GetObjectByTag("cut39_chain2");
    object oChain3 = GetObjectByTag("cut39_chain3");
    object oChain4 = GetObjectByTag("cut39_chain4");

    //effects
    effect eVfx1 = EffectVisualEffect(VFX_IMP_AC_BONUS);
    effect eVfx2 = EffectVisualEffect(VFX_IMP_MAGBLUE);
    effect eLink = EffectLinkEffects(eVfx1, eVfx2);

    //Set all objects as cutscene active
    CutSetActiveCutsceneForObject(oAssistant, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrow3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDoor, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oChain1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oChain2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oChain3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oChain4, nCutsceneNumber);

    // Change the music

    object oArea = GetArea(oPC);

    MusicBattlePlay(oArea);

    // Cutscene waypoint locations
    location lPC1 = GetLocation(GetWaypointByTag("wp_q2dcut39_pc1"));
    location lAssistant1 = GetLocation(GetWaypointByTag("wp_cut39_assistant_1"));
    location lAssistant2 = GetLocation(GetWaypointByTag("wp_cut39_assistant_2"));
    location lAssistant3 = GetLocation(GetWaypointByTag("wp_cut39_assistant_3"));
    location lAssistant4 = GetLocation(GetWaypointByTag("wp_cut39_assistant_4"));
    location lDrow1 = GetLocation(GetWaypointByTag("wp_cut39_drow_1"));
    location lDrow2 = GetLocation(GetWaypointByTag("wp_cut39_drow_2"));
    location lDrow3 = GetLocation(GetWaypointByTag("wp_cut39_drow_3"));

    location lChain1 = GetLocation(oChain1);
    location lChain2 = GetLocation(oChain2);
    location lChain3 = GetLocation(oChain3);
    location lChain4 = GetLocation(oChain4);

    //Camera waypoints

    location lCamera1 = GetLocation(GetWaypointByTag("wp_q2dcut39_camera1"));
    object oCamera1 = GetWaypointByTag("wp_q2dcut39_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("wp_q2dcut39_camera2"));

    //Make a copy of the PC to move about
    //location lStart = GetLocation(GetWaypointByTag("wp_q2ccut39_copystart"));
    //object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut39Copy");
    //ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    //CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);
    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////

    CutJumpToObject(0.0, oPC, oCamera1, FALSE);

    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(7.5, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(30.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutActionMoveToLocation(9.0, oPC, lCamera2, TRUE, FALSE);


    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Assistant runs by - chased by drow
    CutActionMoveToLocation( 2.5, oAssistant, lAssistant1, TRUE, FALSE);
    CutSetFacingPoint(6.5, oAssistant, "wp_q2dcut39_camera1", FALSE);

    CutSpeakStringByStrRef(7.5, oAssistant, 84084, FALSE);
    CutPlayVoiceChat(7.5, oAssistant, VOICE_CHAT_CUSS, FALSE);
    CutActionMoveToLocation(8.5, oAssistant, lAssistant2, TRUE, FALSE);

    CutActionMoveToLocation(7.5, oDrow1, lDrow1, TRUE, FALSE);
    CutActionMoveToLocation(9.0, oDrow2, lDrow3, TRUE, FALSE);
    CutActionMoveToLocation(7.5, oDrow3, lDrow2, TRUE, FALSE);

    CutActionMoveToLocation(11.5, oAssistant, lAssistant3, TRUE, FALSE);
    //Drow try to bash the door down
    CutActionAttack(13.0, oDrow1, oDoor);
    CutActionAttack(13.5, oDrow3, oDoor);

    CutSpeakStringByStrRef(13.5, oDrow2, 84085);
    CutActionCloseDoor(17.0, oDoor, oDoor);
    //Assistant Slams door on drow
    CutActionLockObject(14.5, oAssistant, oDoor, FALSE);
    CutActionMoveToLocation(30.5, oAssistant, lAssistant3, TRUE, FALSE);
    CutSetFacingPoint(35.0, oAssistant, "wp_cut39_assistant_3", FALSE);
    //Chains 'Explode'
    CutApplyEffectToObject2(17.5, DURATION_TYPE_INSTANT, eLink,oChain1, 0.0);
    CutApplyEffectToObject2(17.5, DURATION_TYPE_INSTANT, eLink,oChain2, 0.0);
    CutApplyEffectToObject2(17.5, DURATION_TYPE_INSTANT, eLink,oChain3, 0.0);
    CutApplyEffectToObject2(17.5, DURATION_TYPE_INSTANT, eLink,oChain4, 0.0);

    CutDestroyObject(18.0, oChain1, FALSE);
    CutDestroyObject(18.0, oChain2, FALSE);
    CutDestroyObject(18.0, oChain3, FALSE);
    CutDestroyObject(18.0, oChain4, FALSE);

    CutActionCloseDoor(20.0, oDoor, oDoor);
    CutActionCloseDoor(25.0, oDoor, oDoor);
    DelayCommand(20.0, SetLocked(oDoor, TRUE));
    DelayCommand(25.0, SetLocked(oDoor, TRUE));

    //Drow walk back in frustration
    CutClearAllActions(19.0, oDrow1, TRUE);
    CutActionMoveToLocation(19.5, oDrow1, lDrow1, TRUE, FALSE);
    CutClearAllActions(20.0, oDrow3, TRUE);
    CutActionMoveToLocation(20.5, oDrow3, lDrow2, TRUE, FALSE);

    CutSpeakStringByStrRef(23.0, oDrow2, 84086, FALSE);
    CutSpeakStringByStrRef(28.0, oDrow2, 84087, FALSE);

    //Drow salute and go back to bashing the door down
    CutSetFacingPoint(25.0, oDrow1, "cut39_drow2", FALSE);
    CutSetFacingPoint(25.7, oDrow3, "cut39_drow2", FALSE);
    CutPlayAnimation(33.5, oDrow1, ANIMATION_FIREFORGET_SALUTE, 1.0, FALSE);

    CutActionAttack(34.5, oDrow1, oDoor);
    CutActionAttack(35.0, oDrow3, oDoor);
    CutActionMoveToLocation(35.0, oDrow2, lCamera1, FALSE, FALSE);

    // End Cutscene
    CutFadeOutAndIn(39.0, oPC);
    CutDestroyObject(40.0, oDrow2, FALSE);
    CutDisableCutscene(nCutsceneNumber, 41.0, 41.0, RESTORE_TYPE_NORMAL);
    DelayCommand(42.0, ChangeToStandardFaction(oDrow1, STANDARD_FACTION_HOSTILE));
    DelayCommand(42.0, ChangeToStandardFaction(oDrow3, STANDARD_FACTION_HOSTILE));
}


