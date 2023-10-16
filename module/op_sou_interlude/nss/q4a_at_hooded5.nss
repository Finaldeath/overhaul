// change hooded figure into Heurodis


void main()
{
    if(GetLocalInt(OBJECT_SELF, "DIALOG_STATUS") == 1)
    {
        SetLocalObject(OBJECT_SELF, "ACTIVE_PC1", GetPCSpeaker());
        SignalEvent(OBJECT_SELF, EventUserDefined(101));
    }
    else if(GetLocalInt(OBJECT_SELF, "DIALOG_STATUS") == 2)
    {
        SetLocalObject(OBJECT_SELF, "ACTIVE_PC2", GetPCSpeaker());
        SignalEvent(OBJECT_SELF, EventUserDefined(102));
    }
}
