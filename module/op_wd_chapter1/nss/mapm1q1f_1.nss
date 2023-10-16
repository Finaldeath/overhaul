void main()
{
    object oEnter = GetEnteringObject();
    if( ( GetIsObjectValid( GetItemPossessedBy(oEnter,"M1Q2PlotReagent")) ||
          GetIsObjectValid( GetItemPossessedBy(oEnter,"M1Q3PlotReagent")) ||
          GetIsObjectValid( GetItemPossessedBy(oEnter,"M1Q4PlotReagent")) ||
          GetIsObjectValid( GetItemPossessedBy(oEnter,"M1Q5PlotReagent")) ) &&
          GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") >= 75  )
    {
        object oAribeth = GetLocalObject(GetModule(),"M1Q1Aribeth");
        object oAttendant = GetLocalObject(GetModule(),"NW_G_M1Q5Atte");
        object oDoor = GetObjectByTag("M1Q1_M1Q6A1");
        SignalEvent(oAttendant, EventUserDefined(110));
        SignalEvent(oAribeth, EventUserDefined(111));
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        SetLocalInt(GetModule(),"NW_G_M1Q1MainPlot", 100);
    }
}
