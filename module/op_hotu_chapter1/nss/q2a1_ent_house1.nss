//::///////////////////////////////////////////////
//:: Name q2a1_ent_house1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have the old man run and seal the upstairs door
    when a PC enters the house
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:July 15/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oOldMan = GetObjectByTag("q2a1houseman");
        object oTarget = GetWaypointByTag("wp_q2a1oldmanrun");
        object oDoor = GetObjectByTag("q2a1_house1lockdoor");
        DelayCommand(1.0, AssignCommand(oOldMan, SpeakStringByStrRef(83982)));
        DelayCommand(1.2, AssignCommand(oOldMan, ActionMoveToObject(oTarget, TRUE, 0.0)));
        DestroyObject(oOldMan, 4.0);
        DelayCommand(4.0, AssignCommand(oDoor, ActionCloseDoor(oDoor)));


    }
}
