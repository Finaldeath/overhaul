void main()
{
if((GetLocalInt(GetModule(),"M2Q1JaxLeavesInn") == 1) && (GetTag(GetArea(OBJECT_SELF)) == "MAP_M2Q1B"))
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(200));
    }
if((GetLocalInt(GetModule(),"M2Q1JaxLeavesInn") == 1) && (GetTag(GetArea(OBJECT_SELF)) == "MAP_M2Q2")
     && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q2ITKEYTEMPLE")))
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(201));
    }
    
}
