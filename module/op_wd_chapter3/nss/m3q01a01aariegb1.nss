void main()
{
    SetCustomToken(100,GetName(GetPCSpeaker()));
    SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
    SetLocalObject(OBJECT_SELF,"NW_L_M3Q01TALKPARTYLEADER",GetPCSpeaker());
    AssignCommand(GetNearestObjectByTag("Uthgardtinterior"), ActionOpenDoor(GetNearestObjectByTag("Uthgardtinterior")));
    AssignCommand(GetNearestObjectByTag("Uthgardtinterior2"), ActionOpenDoor(GetNearestObjectByTag("Uthgardtinterior2")));
}
