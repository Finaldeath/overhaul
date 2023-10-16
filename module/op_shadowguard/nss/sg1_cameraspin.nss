//SG1_CameraSpin.nss
//
//  (A self-calling script on the PC to handle the repeating camera rotation
//   at the end of the module.)

void main()
{
    //Allow the camera spin to be stopped through the setting of a variable.
    int bStopSpin = GetLocalInt(GetModule(), "bStopEndCameraSpin");

    if (bStopSpin == FALSE)
    {
        //First 90-degree arc.
        SetCameraFacing(0.0, 25.0, 80.0, CAMERA_TRANSITION_TYPE_SLOW);
        //Second 90-degree arc
        DelayCommand(4.0, SetCameraFacing(90.0, 25.0, 80.0, CAMERA_TRANSITION_TYPE_SLOW));
        //Third 90-degree arc
        DelayCommand(8.0, SetCameraFacing(180.0, 25.0, 80.0, CAMERA_TRANSITION_TYPE_SLOW));
        //Fourth 90-degree arc
        DelayCommand(12.0, SetCameraFacing(270.0, 25.0, 80.0, CAMERA_TRANSITION_TYPE_SLOW));

        //Refire the script on a delay
        DelayCommand(16.0, ExecuteScript("SG1_CameraSpin", OBJECT_SELF));
    }
}
