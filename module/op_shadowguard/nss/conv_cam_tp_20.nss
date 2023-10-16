void main()
{
    float f = 20.0;

    object oPC = GetPCSpeaker();

    SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);

    SetCameraFacing(GetFacing(oPC), f);
}
