//::///////////////////////////////////////////////
//:: Witchwork 1: Caldrian, Camera 2
//:: WW1_Cald_Camera2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Move the camera to face the ghost.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 1, 2002
//:://////////////////////////////////////////////

void main()
{
    //Calculate the camera angle required to focus on the ghost.
    object oPC = GetPCSpeaker();
    vector vPC = GetPosition(oPC);
    object oGhostSpawn = GetObjectByTag("WP_mineghost");
    vector vGhost = GetPosition(oGhostSpawn);
    float fX = vGhost.x - vPC.x;
        //Prevent potential divide by 0 errors in the VectorToAngle conversion.
        if (fX == 0.0)
        {
            fX = 0.1;
        }
    float fY = vGhost.y - vPC.y;
    float fCamera = VectorToAngle(Vector(fX, fY, 0.0));

    //Perform Camera movement...
    AssignCommand(oPC, SetCameraFacing(fCamera, 6.0, 65.0, CAMERA_TRANSITION_TYPE_VERY_FAST));
}
