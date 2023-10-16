// user defined event for plate trigger

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101) // enter
    {
        object oEnter = GetLocalObject(OBJECT_SELF, "ENTERING_OBJECT");
        if(GetTag(oEnter) == "NW_GARGOYLE")
            return; // not handling gargoyle statues
        SetLocalObject(GetArea(OBJECT_SELF), "Q2B_ON_PLATE" + ObjectToString(oEnter), OBJECT_SELF); // flag for a save/load game

        if(GetLocalInt(GetArea(OBJECT_SELF), "Q2B_PLATES_STATUS") == 0)
            return; // status 0=> puzzle is not active

        // now, need to assemble the corresponding plate tag
        string sNum = GetStringRight(GetTag(OBJECT_SELF), GetStringLength(GetTag(OBJECT_SELF)) - 14);
        object oPlate = GetObjectByTag("XQ2B_PLATE" + sNum);
        int nEnterCount = GetLocalInt(OBJECT_SELF, "ENTER_COUNT");
        nEnterCount++; // update the number of creatures on the plate.


        //SendMessageToPC(GetFirstPC(),
        //    "ENTER event for plate " + GetTag(OBJECT_SELF) + ", count= " + IntToString(nEnterCount));

        SetLocalInt(OBJECT_SELF, "ENTER_COUNT", nEnterCount);
       int nStatus = GetLocalInt(GetArea(OBJECT_SELF), GetTag(OBJECT_SELF));

        if(nStatus == 1) // status is already down - do nothing
            return;
        SetLocalInt(GetArea(OBJECT_SELF), "XQ2B_PLATE" + sNum, 1); // update status to "down"

        DestroyObject(oPlate);
        AssignCommand(GetEnteringObject(), PlaySound("as_sw_stonplate1"));
        DelayCommand(2.0, SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102))); // check if puzzle is solved
    }
    else if(nEvent == 102) // exit
    {
        SetLocalObject(GetArea(OBJECT_SELF), "Q2B_ON_PLATE" + ObjectToString(GetExitingObject()), OBJECT_INVALID); // flag for a save/load game

        if(GetLocalInt(GetArea(OBJECT_SELF), "Q2B_PLATES_STATUS") == 0)
            return; // status 0=> puzzle is not active

        // first, the trigger number
        string sNum = GetStringRight(GetTag(OBJECT_SELF), GetStringLength(GetTag(OBJECT_SELF)) - 14);
        object oPlatePlace = GetObjectByTag("Q2B_PLATE" + sNum);
        // get the plate tag
        string sTag = "XQ2B_PLATE" + sNum;
        int nEnterCount = GetLocalInt(OBJECT_SELF, "ENTER_COUNT");

        nEnterCount--; // update the number of creatures on the plate.

        //SendMessageToPC(GetFirstPC(),
        //    "EXIT event for plate " + GetTag(OBJECT_SELF) + ", count= " + IntToString(nEnterCount));

        SetLocalInt(OBJECT_SELF, "ENTER_COUNT", nEnterCount);
        if(nEnterCount > 0) // someone is still on the plate - do nothing
            return;

        CreateObject(OBJECT_TYPE_PLACEABLE, "q2b_plate", GetLocation(oPlatePlace), FALSE, sTag);
        SetLocalInt(GetArea(OBJECT_SELF), sTag, 0); // update status to "down"

        PlaySound("as_sw_stonplate1");
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(102)); // check if puzzle is solved
    }
}
