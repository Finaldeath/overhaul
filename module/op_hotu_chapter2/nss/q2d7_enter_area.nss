//::///////////////////////////////////////////////
//:: Name q2d7_enter_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The only way to enter this area is through talking
    to the pit boss and setting up a fight.  Looking
    in the view ports up top jumps the PC here.
    If the fight hasn't happened yet - set up the fight.
    If joined in progress, jump the Pc in to view.


*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 7/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"

void StartCutscene(object oPC);

int nCutsceneNumber = 23;

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //Fade PCs to black
    BlackScreen(oPC);
    //Set Cutscene 23 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);


    //if this pc is the first to jump into the area - so the fight hasn't started... start the fight
    if (GetLocalInt(GetModule(), "X2_Q2DPitFightOn") == 0)
    {
        SetLocalInt(GetModule(), "X2_Q2DPitFightOn", 1);
        //Create the Pit Fight Contestants in a separate area so they can be jumped later...
        location lSpawn1 = GetLocation(GetWaypointByTag("wp_q2d7npc_spawn1"));
        location lSpawn2 = GetLocation(GetWaypointByTag("wp_q2d7npc_spawn2"));
        string szResRefRed = GetLocalString(GetModule(), "X2_Q2DRedGlad");

        string szResRefBlue = GetLocalString(GetModule(), "X2_Q2DBlueGlad");
        object oRedGlad = CreateObject(OBJECT_TYPE_CREATURE, szResRefRed, lSpawn1, FALSE, "pitgladred");
        //if the Red Gladiator is the PCs slave girl - check to see if the PC has spent money
        //on equipping her - if so, change her equipment.
        if (GetLocalInt(GetModule(), "X2_Q2DEquipPitSlave") == 1)
        {
            SetLocalInt(GetModule(), "X2_Q2DEquipPitSlave", 0);

            object oSword = GetItemPossessedBy(oRedGlad, "q2d2redgladsword");
            object oArmor = GetItemPossessedBy(oRedGlad, "q2dredgladrobe2");
            AssignCommand(oRedGlad, ActionDoCommand(ActionEquipItem(oSword, INVENTORY_SLOT_RIGHTHAND)));
            AssignCommand(oRedGlad, ActionDoCommand(ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST)));

        }


        CreateObject(OBJECT_TYPE_CREATURE, szResRefBlue, lSpawn2, FALSE, "pitgladblue");


        CutSetActiveCutsceneForObject(oPC, nCutsceneNumber, TRUE);
        //CutDisableAbort(nCutsceneNumber);
        CutSetCutsceneMode(0.0, oPC, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates
        CutFadeFromBlack(1.5, oPC, FADE_SPEED_MEDIUM, FALSE);

        DelayCommand(1.5, StartCutscene(oPC));
    }
    //else just jump them in so they can view the rest of the fight
    else
    {
        CutSetActiveCutsceneForObject(oPC, nCutsceneNumber, FALSE);
        CutDisableAbort(nCutsceneNumber);
        CutSetCutsceneMode(0.0, oPC, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates
        CutFadeFromBlack(1.5, oPC, FADE_SPEED_MEDIUM, FALSE);
        //Jump to Spectator target
        object oSpecTarget = GetWaypointByTag("wp_q2d7cut23_spectator");
        CutJumpToObject(1.5, oPC, oSpecTarget, FALSE);
        CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    }

}

void StartCutscene(object oPC)
{


    // Cutscene actors and objects.

    object oRedGlad = GetObjectByTag("pitgladred");
    object oBlueGlad = GetObjectByTag("pitgladblue");
    object oAnnouncer = GetObjectByTag("q2d7announcer");

    //effects

    //Set all objects as cutscene active
    CutSetActiveCutsceneForObject(oRedGlad, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBlueGlad, nCutsceneNumber);
    CutSetActiveCutsceneForObject(oAnnouncer, nCutsceneNumber);
    // Change the music

    object oArea = GetArea(oPC);

    MusicBattlePlay(oArea);

    // Cutscene waypoint locations
    object oRedGladSpawn = GetWaypointByTag("wp_q2d7cut23_redglad1");
    object oBlueGladSpawn = GetWaypointByTag("wp_q2d7cut23_blueglad1");
    location lAnnounce1 = GetLocation(GetWaypointByTag("wp_q2d7announce_1"));


    //Camera waypoints

    location lCamera1 = GetLocation(GetWaypointByTag("wp_q2d7cut23_camera1"));
    object oCamera1 = GetWaypointByTag("wp_q2d7cut23_camera1");

    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////

    CutJumpToObject(0.0, oPC, oCamera1, FALSE);

    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);


    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Announcer Conversation
    CutActionMoveToLocation(1.0, oAnnouncer, lAnnounce1, FALSE, FALSE);
    CutBeginConversation(2.0, oAnnouncer, oAnnouncer, "q2d7announcer", FALSE);
    float fDur = CutGetConvDuration("q2d7announcer");
    //Apply effects at spawn points.

    CutApplyEffectAtLocation(fDur + 1.5 , oPC, DURATION_TYPE_INSTANT, VFX_IMP_AC_BONUS, GetLocation(oRedGladSpawn), 0.0, FALSE);
    CutApplyEffectAtLocation(fDur + 1.5, oPC, DURATION_TYPE_INSTANT, VFX_FNF_PWSTUN, GetLocation(oRedGladSpawn), 0.0, FALSE);
    CutApplyEffectAtLocation(fDur + 1.5, oPC, DURATION_TYPE_INSTANT, VFX_IMP_AC_BONUS, GetLocation(oBlueGladSpawn), 0.0, FALSE);
    CutApplyEffectAtLocation(fDur + 1.5, oPC, DURATION_TYPE_INSTANT, VFX_FNF_PWSTUN, GetLocation(oBlueGladSpawn), 0.0, FALSE);


    //Jump Gladiators in to arena
    CutJumpToObject(fDur + 2.0, oRedGlad, oRedGladSpawn, FALSE);
    CutJumpToObject(fDur + 2.0, oBlueGlad, oBlueGladSpawn, FALSE);
    // END CUTSCENE:  handled in death scripts of the gladiators

    //CutFadeOutAndIn(26.0, oPC);

    //CutDisableCutscene(nCutsceneNumber, 28.0, 28.0, RESTORE_TYPE_COPY);
}
