void main()
{
    SetLocked(OBJECT_SELF,FALSE);
    ActionOpenDoor(OBJECT_SELF);
    SetLocalInt(GetModule(),"NW_G_M1Q6F3DoorOpen",1);
    AssignCommand(GetNearestObjectByTag("M1Q6F3YARI"),SpeakOneLinerConversation());

}
