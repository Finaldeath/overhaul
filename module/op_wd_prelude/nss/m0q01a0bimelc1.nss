void main()
{
    SetLocalInt(GetPCSpeaker(),"SkipTutorial",99);
        SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",5);
        SetLocalInt(GetPCSpeaker(),"NW_L_M1Q0Rested",TRUE);
        SetLocalInt(OBJECT_SELF,"CameraTest",0);
       object oDoor = GetNearestObjectByTag("M1Q0A_M1Q0B");
    SetLocked(oDoor,FALSE);
    AssignCommand(oDoor,ActionOpenDoor(oDoor));
}
