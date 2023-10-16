void main()
{
    SetLocalInt(OBJECT_SELF, "DIALOG_STATUS", 2); // when player aborts from this point -> jump to next module
    SetCameraMode(GetPCSpeaker(), CAMERA_MODE_TOP_DOWN);
    AssignCommand(GetPCSpeaker(), SetCameraFacing(135.0, 6.0, 50.0, CAMERA_TRANSITION_TYPE_FAST));
    SetLocalObject(OBJECT_SELF, "ACTIVE_PC2", GetPCSpeaker());
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, GetPCSpeaker());
    object oWP = GetWaypointByTag("Q4A_WP_HENCHMAN");
    if(oHenchman != OBJECT_INVALID)
    {
        AssignCommand(oHenchman, ClearAllActions());
        AssignCommand(oHenchman, ActionForceMoveToObject(oWP, FALSE, 0.0, 5.0));
    }
}
