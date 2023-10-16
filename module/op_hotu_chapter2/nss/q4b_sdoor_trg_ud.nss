// Secret door trigger user defined event: reveal door

void main()
{
    string sTag = GetTag(OBJECT_SELF);
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // reveal door
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CREATE_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_CREATE_ONCE", 1);

        location locLoc = GetLocation (OBJECT_SELF);
        object oidDoor;
        // yes we found it, now create the appropriate door
        oidDoor = CreateObject(OBJECT_TYPE_PLACEABLE,"q4b_secret_door",locLoc,TRUE);

        int nLen = GetStringLength(sTag);
        string sNewTag = GetStringLeft(sTag, nLen - 1);
        if(GetStringRight(sTag, 1) == "a")
            SetLocalString( oidDoor, "Destination" , sNewTag + "b" );
        else
            SetLocalString( oidDoor, "Destination" , sNewTag + "a" );
        AssignCommand(oidDoor, PlayAnimation(ANIMATION_PLACEABLE_OPEN));
        SetLocalInt(OBJECT_SELF,"D_"+sTag,1);
        SetPlotFlag(oidDoor,1);
        SetLocalObject(OBJECT_SELF,"Door",oidDoor);
    }
}
