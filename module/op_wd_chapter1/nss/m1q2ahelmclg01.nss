int StartingConditional()
{
    //return GetIsObjectValid(GetLocalObject(OBJECT_SELF,"Evil")) == FALSE;
    if (!GetIsObjectValid(GetLocalObject(OBJECT_SELF,"Evil")) &&
        !GetIsObjectValid(GetPCSpeaker()))
    {
        return TRUE;
    }
    return FALSE;
}
