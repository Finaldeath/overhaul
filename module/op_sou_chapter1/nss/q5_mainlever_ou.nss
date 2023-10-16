//::///////////////////////////////////////////////
//:: main doors lever on-used
//:: q5_maillever_ou
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    the 4-door puzzle: the player needs to open the doors in the right order, by using the levers.
    The banners near each door mark the room with the right lever to use. Failing to use the right lever
    would cause all open doors to close.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 14/2/2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    string sTag = GetTag(OBJECT_SELF);
    string sNum = GetStringRight(sTag, 1);
    int nLeverNum = StringToInt(sNum);

    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    // status can be 1 to 4 marking which door is open (and so - all doors leading to that)
    int nStatus = GetLocalInt(GetArea(OBJECT_SELF), "Q5A_MAIN_DOOR_STATUS");

    if(nLeverNum == nStatus + 1) // pulled the right lever for the next door
    {
        // change status and open the door
        nStatus++;
        SetLocalInt(GetArea(OBJECT_SELF), "Q5A_MAIN_DOOR_STATUS", nStatus);
        string sDoorTag = "Q5A_MAIN_DOOR" + IntToString(nStatus);
        object oDoor = GetNearestObjectByTag(sDoorTag);
        SetLocked(oDoor, FALSE);
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        DelayCommand(1.0, PlaySound("dooropening"));
        DelayCommand(1.0, FloatingTextStrRefOnCreature(40398, oPC, FALSE));
    }
    else // pulled wrong lever
    {
        int nMessage;
        if(nStatus == 1)
            nMessage = 40399;
        else if(nStatus == 0)
            nMessage = 40400;
        else
            nMessage = 40401;

        DelayCommand(1.0, PlaySound("doorclosing"));
        DelayCommand(1.0, FloatingTextStrRefOnCreature(nMessage, oPC, FALSE));
        while(nStatus > 0)
        {
            string sDoorTag = "Q5A_MAIN_DOOR" + IntToString(nStatus);
            object oDoor = GetNearestObjectByTag(sDoorTag);
            AssignCommand(oDoor, ActionCloseDoor(oDoor));
            SetLocked(oDoor, TRUE);
            nStatus--;
            SetLocalInt(GetArea(OBJECT_SELF), "Q5A_MAIN_DOOR_STATUS", nStatus);
            // now, need to close door with number == nStatus

        }
    }
}
