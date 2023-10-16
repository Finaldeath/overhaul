void main()
{
if(GetLocalInt(OBJECT_SELF,"M2Q2TrollBearDoorOpen") == 0)
    {
    SignalEvent(GetObjectByTag("M2Q2TROLLBEARDOOR"),EventUserDefined(200));
    SetLocalInt(OBJECT_SELF,"M2Q2TrollBearDoorOpen",1);
    }
    else
    {
    SignalEvent(GetObjectByTag("M2Q2TROLLBEARDOOR"),EventUserDefined(201));
    SetLocalInt(OBJECT_SELF,"M2Q2TrollBearDoorOpen",0);
    }
}
