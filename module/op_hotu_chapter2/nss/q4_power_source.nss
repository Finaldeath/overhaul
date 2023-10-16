// Power source used:
// place a mythalar placeable and blow up the whole area after a few seconds

void CreateBomb(location lLoc)
{
    object oBomb = CreateObject(OBJECT_TYPE_PLACEABLE, "q4c_power_source", lLoc);
    SignalEvent(oBomb, EventUserDefined(101));
}

void main()
{
    object oPC = GetItemActivator();
    DelayCommand(1.0, CreateBomb(GetLocation(oPC)));
}
