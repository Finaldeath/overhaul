//::///////////////////////////////////////////////
//:: Name  q2a_starttam
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      Open the PCs door and have Tamsil talk to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 8/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_PCDoorOpen") == 1)
        return;
    SetLocalInt(GetModule(), "X2_PCDoorOpen", 1);
    //Open the PCs door and have Tamsil talk to the PC
            object oDoor = GetObjectByTag("q2a_start_door");
            object oTamsil = CreateObject(OBJECT_TYPE_CREATURE, "Tamsil", GetLocation(GetWaypointByTag("q2arooms_tamsil")));
            location lTamsil = GetLocation(GetWaypointByTag("q2a_enter_playerx"));
            SetLocked(oDoor, FALSE);
            //AssignCommand(oDoor, ActionOpenDoor(oDoor));


            object oPC1 = OBJECT_SELF;//GetPCSpeaker();
            AssignCommand(oTamsil, ActionForceMoveToObject(oPC1, TRUE, 3.0, 10.0));
            AssignCommand(oTamsil, ActionStartConversation(oPC1, "pre_tamsil"));


           SetLocalInt(GetModule(), "nStartTamsil", 1);
}
