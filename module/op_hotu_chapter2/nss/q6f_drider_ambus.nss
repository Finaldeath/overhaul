// Create driders at way-points

void CreateDrider(string sBP, location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, sBP, lLoc, TRUE);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oWP = GetFirstObjectInArea(GetArea(OBJECT_SELF));
    string sTag;
    string sBP;
    float fDelay;
    while(oWP != OBJECT_INVALID)
    {
        sTag = GetTag(oWP);
        if(GetStringRight(sTag, 5) == "wp_sp")
        {
            sBP = GetStringLeft(sTag, GetStringLength(sTag) - 6);
            DelayCommand(fDelay, CreateDrider(sBP, GetLocation(oWP)));
            fDelay += 0.5;
        }

        oWP = GetNextObjectInArea(GetArea(OBJECT_SELF));
    }

}
