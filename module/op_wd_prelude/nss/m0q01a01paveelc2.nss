//////////
///// Set the CameraTest local variable to 1 (Top down mode)
///////

void main()
{
    SetLocalInt(OBJECT_SELF,"CameraTest",1);
    SetCameraMode(GetPCSpeaker(),CAMERA_MODE_TOP_DOWN);
}
