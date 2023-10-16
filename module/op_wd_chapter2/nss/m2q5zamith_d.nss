//::///////////////////////////////////////////////
//:: User Defined
//:: M2Q5ZAMITH_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zamithra moves up to her room.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 12, 2002
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oDoor = GetObjectByTag("WP_WITLESS");
    object oExit = GetObjectByTag("M2Q5N_M2Q5F");
    object oWitless = GetObjectByTag("M2Q1CWITL");

    switch (nEvent)
    {
        case 500:
            // Goes upstairs with the witless fighter
            SignalEvent(oWitless,EventUserDefined(500));
            SetLocalInt(OBJECT_SELF,"NW_L_Moving",10);
            ActionForceMoveToObject(oDoor,FALSE,1.9,10.0);
            SetCommandable(FALSE);
        break;
        case 501:
            // Goes upstairs to wait for PC
            SetLocalInt(OBJECT_SELF,"NW_L_Moving",10);
            SetLocalInt(GetModule(),"NW_L_ZamithraTakePC",10);
            ActionForceMoveToObject(oDoor,FALSE,1.9,10.0);
            SetCommandable(FALSE);
        break;
        case 502:
            SetLocalInt(GetArea(OBJECT_SELF),"NW_A_ZamithraLeave",10);
            ActionForceMoveToObject(oExit,FALSE,1.9,10.0);
            ActionOpenDoor(oExit);
            //ActionDoCommand(AssignCommand(oExit,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF))));
            ActionDoCommand(DestroyObject(OBJECT_SELF));
            SetCommandable(FALSE);
        break;
    }
}
