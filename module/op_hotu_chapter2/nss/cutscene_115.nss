//::///////////////////////////////////////////////
//:: Name cutscene_115
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Boatman's Ride.
    Show the PC/Boat gliding over the dark river
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 25/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"

#include "x2_inc_toollib"

int nCutsceneNumber = 115;

void StartCutscene(object oPC);
void JumpToDestination(object oPC);

void CallFreeze(int nCutscene, object oPC)
{
    if(CutGetActiveCutsceneForObject(oPC) == nCutscene)
    {
        FreezeAssociate(oPC, FALSE);
    }
}

void CutFreeze(float fDelay, object oPC)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallFreeze(nCutscene, oPC));
}
void main()
{
    //Get the PC however we are going to do it for this cutscene
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    //Fade PCs to black
    BlackScreen(oPC);

    //The Function so nice - I called it thrice (triple the water effects)    //original - 3.2
    TLChangeAreaGroundTiles(GetArea(OBJECT_SELF), X2_TL_GROUNDTILE_WATER, 10, 10, 4.2);
    TLChangeAreaGroundTiles(GetArea(OBJECT_SELF), X2_TL_GROUNDTILE_WATER, 10, 10, 4.2);
    TLChangeAreaGroundTiles(GetArea(OBJECT_SELF), X2_TL_GROUNDTILE_WATER, 10, 10, 4.2);


    object oArea = GetArea(oPC);

    //change music
    MusicBattlePlay(oArea);

    object oHench1, oHench2;
    string szArea = GetTag(oArea);

    //Set a local int on the area to show that cutscene 101 is running
    SetLocalInt(oArea, "X2_CutScene115", 1);

    //Set Cutscene 115 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);

    //Fade the PC to Black
    //Set Cutscene mode on the player do the fade
    AssignCommand(oPC, ClearAllActions());

    CutSetActiveCutsceneForObject(oPC, nCutsceneNumber, TRUE);
    //Make Each Henchmen Invis
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        CutSetActiveCutsceneForObject(oHench, nCutsceneNumber, FALSE);
        //CutApplyEffectToObject(0.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oHench);
        i++;
        oHench = GetHenchman(oPC, i);
    }

    CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM, FALSE);

    effect eEff = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEff))
    {
        if(GetEffectType(eEff) == EFFECT_TYPE_POLYMORPH)
            RemoveEffect(oPC, eEff);
        eEff = GetNextEffect(oPC);
    }


    DelayCommand(1.0, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{
    // Cutscene actors and objects.
    object oHenchWait = GetObjectByTag("cut115HenchWait");
    object oBat1 = GetObjectByTag("cut115bat1");
    object oBat2 = GetObjectByTag("cut115bat2");
    object oBat3 = GetObjectByTag("cut115bat3");
    object oBat4 = GetObjectByTag("cut115bat4");
    object oBat5 = GetObjectByTag("cut115bat5");
    object oBat6 = GetObjectByTag("cut115bat6");
    object oBat7 = GetObjectByTag("cut115bat7");
    object oBat8 = GetObjectByTag("cut115bat8");
    object oBat9 = GetObjectByTag("cut115bat9");
    object oBat10 = GetObjectByTag("cut115bat10");

    CutSetActiveCutsceneForObject(oBat1, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat2, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat3, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat4, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat5, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat6, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat7, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat8, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat9, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat10, nCutsceneNumber);


    //effects
    effect eShape = EffectPolymorph(95, TRUE);
    effect eFly = EffectDisappear();

    //Set all objects as cutscene active

    // Cutscene waypoint locations
    object oBoat_Loc_1 = GetWaypointByTag("cut115wp_boat1");
    object oWPBat4 = GetWaypointByTag("cut115wp_bat4");
    object oWPBat5 = GetWaypointByTag("cut115wp_bat5");
    object oWPBat6 = GetWaypointByTag("cut115wp_bat6");
    object oWPBat7 = GetWaypointByTag("cut115wp_bat7");
    object oWPBat8 = GetWaypointByTag("cut115wp_bat8");
    object oWPBat9 = GetWaypointByTag("cut115wp_bat9");
    object oWPBat10 = GetWaypointByTag("cut115wp_bat10");



    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut115wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut115wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut115wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut115wp_camera3"));

    //Make a copy of the PC to move about
    location lStart = GetLocation(GetWaypointByTag("cut115wp_copystart"));
    object oCopy =  CutCreatePCCopy(oPC, lStart, "Cut115Copy");
    ChangeToStandardFaction(oCopy, STANDARD_FACTION_COMMONER);
    CutSetActiveCutsceneForObject(oCopy, nCutsceneNumber);

    //Turn Copy into a boat
    CutApplyEffectToObject2(0.0, DURATION_TYPE_PERMANENT, eShape, oCopy);
    CutApplyEffectToObject(0.0, DURATION_TYPE_PERMANENT, VFX_DUR_ANTI_LIGHT_10, oCopy);


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutSetCutsceneMode(0.0, oPC, TRUE, CUT_CAMERA_HEIGHT_VERY_HIGH, TRUE, 2); // pc invis - keep and freeze associates

    CutJumpToObject(0.2, oPC, oCamera1, FALSE);
    CutJumpAssociateToLocation(1.0, oPC, GetLocation(oHenchWait));
    CutJumpAssociateToLocation(1.3, oPC, GetLocation(oHenchWait));
    CutFreeze(1.5, oPC);
    CutSetCamera(0.2, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 5.0, 85.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(1.3, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 5.0, 85.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(1.5, oPC, CAMERA_MODE_TOP_DOWN, 20.0, 15.0, 85.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(13.0, oPC, CAMERA_MODE_TOP_DOWN, 220.0, 10.0, 85.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutSetCamera(20.0, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 5.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutActionMoveToLocation(1.5, oPC, lCamera2, FALSE, FALSE);
    CutActionMoveToLocation(13.0, oPC, lCamera3, FALSE, FALSE);

    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Move the PC Boat around
    CutActionMoveToObject(1.0, oCopy, oBoat_Loc_1, FALSE, FALSE);

    //Bat stuff
    CutApplyEffectToObject2(2.0, DURATION_TYPE_PERMANENT, eFly, oBat1);
    CutApplyEffectToObject2(3.0, DURATION_TYPE_PERMANENT, eFly, oBat2);
    CutApplyEffectToObject2(4.0, DURATION_TYPE_PERMANENT, eFly, oBat3);

    CutActionMoveToObject(4.0, oBat4, oWPBat4, TRUE, FALSE);
    CutApplyEffectToObject2(8.0, DURATION_TYPE_PERMANENT, eFly, oBat4);
    CutActionMoveToObject(4.5, oBat5, oWPBat5, TRUE, FALSE);
    CutApplyEffectToObject2(9.0, DURATION_TYPE_PERMANENT, eFly, oBat5);
    CutActionMoveToObject(6.0, oBat6, oWPBat6, TRUE, FALSE);
    CutApplyEffectToObject2(10.0, DURATION_TYPE_PERMANENT, eFly, oBat6);
    CutActionMoveToObject(6.5, oBat7, oWPBat7, TRUE, FALSE);
    CutApplyEffectToObject2(11.0, DURATION_TYPE_PERMANENT, eFly, oBat7);
    CutActionMoveToObject(7.0, oBat8, oWPBat8, TRUE, FALSE);
    CutApplyEffectToObject2(15.0, DURATION_TYPE_PERMANENT, eFly, oBat8);
    CutActionMoveToObject(10.0, oBat9, oWPBat9, TRUE, FALSE);
    CutApplyEffectToObject2(16.0, DURATION_TYPE_PERMANENT, eFly, oBat9);
    CutActionMoveToObject(11.0, oBat10, oWPBat10, TRUE, FALSE);
    CutApplyEffectToObject2(17.0, DURATION_TYPE_PERMANENT, eFly, oBat10);

    // End Cutscene

    CutFadeOutAndIn(25.0, oPC);
    string szWaypoint = GetLocalString(oPC, "X2_BoatmanModule");
    //Clean up actors...
    CutJumpToObject(26.0, oPC, GetWaypointByTag(szWaypoint));

    CutDisableCutscene(nCutsceneNumber, 27.0, 27.0, RESTORE_TYPE_NONE);

    //DelayCommand(27.0, JumpToDestination(oPC));
}

void JumpToDestination(object oPC)
{
    object oArea = GetArea(oPC);
    if (GetTag(oArea) == "q2darkriver")
    {
        string szWaypoint = GetLocalString(oPC, "X2_BoatmanModule");
        AssignCommand(oPC, JumpToObject(GetWaypointByTag(szWaypoint)));
    }
}
