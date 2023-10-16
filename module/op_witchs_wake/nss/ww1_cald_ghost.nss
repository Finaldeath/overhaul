//::///////////////////////////////////////////////
//:: Witchwork 1: Caldrian, Create Mine Ghost
//:: WW1_Cald_Ghost.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn in the Mine Ghost, make it play a
     'chalk-writing' animation
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oPlaceable = GetNearestObjectByTag("ww1_mineghost");
    object oGhostSpawn = GetObjectByTag("WP_mineghost");
    location lGhostSpawn = GetLocation(oGhostSpawn);

    //Put the player in cutscene mode
    SetCutsceneMode(oPC, TRUE);

    //Jump the player to their designated waypoint
    object oPC_WP = GetNearestObjectByTag("WP_PCPost");
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, JumpToLocation(GetLocation(oPC_WP)));

    //Spawn in Ghost.
    CreateObject(OBJECT_TYPE_CREATURE, "ww1_mineghost", lGhostSpawn);

    //Flag the fact that the ghost's spawned in.
    SetLocalInt(OBJECT_SELF, "bGhostSpawned", TRUE);

    //Change the music to the WW theme.
    object oArea = GetArea(OBJECT_SELF);
    MusicBackgroundChangeNight(oArea, 500);
    MusicBackgroundPlay(oArea);

    //Calculate the camera angle required to focus on the ghost.
/*    vector vPC = GetPosition(oPC);
    vector vGhost = GetPosition(oGhostSpawn);
    float fX = vGhost.x - vPC.x;
        //Prevent potential divide by 0 errors in the VectorToAngle conversion.
        if (fX == 0.0)
        {
            fX = 0.1;
        }
    float fY = vGhost.y - vPC.y;
    float fCamera = VectorToAngle(Vector(fX, fY, 0.0));
*/
    //Perform Camera movement...
    AssignCommand(oPC, SetCameraFacing(60.0, 6.0, 65.0, CAMERA_TRANSITION_TYPE_VERY_FAST));

    //Restart the conversation
    DelayCommand(2.0, ActionStartConversation(oPC, "", FALSE, FALSE));
}
