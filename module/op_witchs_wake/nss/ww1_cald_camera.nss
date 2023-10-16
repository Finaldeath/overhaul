//::///////////////////////////////////////////////
//:: Witch Wake 1: Caldrian, Set Camera
//:: WW1_Cald_Camera.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Move the player to the optimal location for
     the coming cinematic and set their camera
     position now so it doesn't come as such a
     surprise when the cutscene begins.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oWP = GetNearestObjectByTag("WP_PCPost");

    //Move them to waypoint.
//    AssignCommand(oPC, ActionForceMoveToObject(oWP, FALSE, 0.1, 5.0));

    //Set the camera for the conv.
//    AssignCommand(oPC, SetCameraFacing(180.0, 5.0, 49.0));
}
