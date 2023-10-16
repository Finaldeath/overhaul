void main()
{
    object oPC = GetPCSpeaker();

   AssignCommand(oPC, SetCameraFacing(35.0f, 6.5f, 65.0f, CAMERA_TRANSITION_TYPE_FAST));
}
