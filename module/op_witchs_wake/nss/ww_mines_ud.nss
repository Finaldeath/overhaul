//::///////////////////////////////////////////////
//:: Witchwork 1: Mines, User-Defined
//:: WW1_Mines_UD.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handles camera rotation during the ghost
     cinematic. Camera controls are handled on the
     area to avoid AI Stack Overflow errors
     received when having Caldrian do it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 1, 2002
//:://////////////////////////////////////////////

void main()
{
    int iUD = GetUserDefinedEventNumber();

    switch (iUD)
    {
        case 5328:
        {
            object oPC = GetLocalObject(OBJECT_SELF, "GhostCinematicPC");

            //Reset the initial camera view in case the player's changed it.
            SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);
            float fDelay = 1.0;
            float fCameraFacing = 180.0;
            float fCameraDistance = 5.0;
            float fCameraPitch = 49.0;
            AssignCommand(oPC, SetCameraFacing(fCameraFacing, fCameraDistance, fCameraPitch));

            //Perform Camera movement...
            while (fCameraFacing > 70.0)
            {
                fDelay = fDelay + 0.005;
                fCameraFacing = fCameraFacing - 0.08;
                fCameraDistance = fCameraDistance + 0.003;

                AssignCommand(oPC, DelayCommand(fDelay, SetCameraFacing(fCameraFacing, fCameraDistance, fCameraPitch)));
            }
        }
        break;
    }
}
