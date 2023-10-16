//::///////////////////////////////////////////////
//:: Name q2d7_ud_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    User defined event 101 fires when the gladiator
    fight is over.
    User defined event 102 fires 1/4 of the time on
    blue gladiators heartbeat - it controls camera angle
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 7/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

int nCutsceneNumber = 23;

void SetGlobalCameraFacing(object oPC, float fZoom);

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    string szAreaTag = "q2dfightpit";
    if (nEvent == 101)
    {
        //For each PC in the area, end the cutscene
        CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT, FALSE);


        object oPC = GetFirstPC();
        while (oPC != OBJECT_INVALID)
        {
            if (GetTag(GetArea(oPC)) == szAreaTag)
            {

                CutFadeOutAndIn(2.5, oPC);

                CutDisableCutscene(nCutsceneNumber, 3.5, 3.5, RESTORE_TYPE_NONE);

                DelayCommand(3.7, AssignCommand(oPC, JumpToLocation(GetLocalLocation(oPC, "X2_Q2DArenaJump"))));
            }
            oPC = GetNextPC();
        }
        object oGlad1 = GetObjectByTag("pitgladblue");
        object oGlad2 = GetObjectByTag("pitgladred");
        object oAnnouncer = GetObjectByTag("q2d7announcer");
        object oAnnounceStart = GetWaypointByTag("wp_q2d7announce_start");
        if (GetIsObjectValid(oGlad1) == TRUE)
            DestroyObject(oGlad1, 3.5);
        if (GetIsObjectValid(oGlad2) == TRUE)
            DestroyObject(oGlad2, 3.5);
        DelayCommand(3.5, AssignCommand(oAnnouncer, JumpToObject(oAnnounceStart)));
    }
    else if (nEvent == 102)
    {
        CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT, FALSE);
        location lCamera;
        int nRandom;
        float fZoom;
        float fFacing;
        object oFacer = GetObjectByTag("q2dcut23_facer");
        object oPC = GetFirstPC();
        while (oPC != OBJECT_INVALID)
        {
            if (GetTag(GetArea(oPC)) == szAreaTag)
            {
                //Pick a random camera waypoint for a target.
                nRandom = Random(4) + 1;
                lCamera = GetLocation(GetWaypointByTag("wp_q2d7cut23_camera" + IntToString(nRandom)));
                //pick a random zoom
                float fZoom = IntToFloat(Random(10) + 10);
                /*switch (nRandom)
                {
                    //Have camera always facing the middle of the arena
                    case 1:     fFacing = 190.0;
                                break;
                    case 2:     fFacing = 280.0;
                                break;
                    case 3:     fFacing = 100.0;
                                break;
                    case 4:     fFacing = 10.0;
                                break;
                }
                CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, fFacing, fZoom, 50.0,
                        CAMERA_TRANSITION_TYPE_MEDIUM);
                */
                CutSetFacingPoint(0.0, oPC, "q2dcut23_facer", FALSE);
                DelayCommand(0.5, SetGlobalCameraFacing(oPC, fZoom));


                CutActionMoveToLocation(1.0, oPC, lCamera, TRUE, FALSE);
            }
            oPC = GetNextPC();
        }

    }
}

void SetGlobalCameraFacing(object oPC, float fZoom)
{
    float fFacing = GetFacing(oPC);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, fFacing, fZoom, 70.0,
                        CAMERA_TRANSITION_TYPE_MEDIUM);
}
