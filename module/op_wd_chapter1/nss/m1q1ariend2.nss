void main()
{
    //Summon Mullond
    object oAttendant = GetLocalObject(GetModule(),"NW_G_M1Q5Atte");
    SignalEvent(oAttendant, EventUserDefined(110));

    //Open Castle Never
    object oDoor = GetObjectByTag("M1Q1_M1Q6A1");
    AssignCommand(oDoor,ActionOpenDoor(oDoor));

    // Leave
    SignalEvent(OBJECT_SELF, EventUserDefined(111));

    //Update Plot
    SetLocalInt(GetModule(),"NW_G_M1Q1MainPlot", 100);

    // destroy Helmites and activate encounters
    SignalEvent(GetModule(),EventUserDefined(600));
}
