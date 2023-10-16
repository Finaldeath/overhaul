//::///////////////////////////////////////////////
//:: Name  q2c4_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When this door (to q2c4) is openned or destroyed,
    The kobold (q2c4_kobold1) on the other side will run to his
    waypoint (wp_q2c4_kobold) and the two drow (q2c4_drow1 and 2)
    will shoot him down.  The kobold has the Yellow Chain in
    his inventory and that is why the drow are chasing him...
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 5/02
//:://////////////////////////////////////////////

#include "x2_inc_compon"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

    //Make sure the puzzle door is closed
    object oDoor = GetObjectByTag("q2c03_door");
    AssignCommand(oDoor, ActionCloseDoor(oDoor));
    SetLocked(oDoor, TRUE);

    object oKobold = GetObjectByTag("q2c4_kobold1");
    object oDrow1 = GetObjectByTag("q2c4_drow1");
    object oDrow2 = GetObjectByTag("q2c4_drow2");
    location lTarget = GetLocation(GetWaypointByTag("wp_q2c4_kobold"));

    AssignCommand(oKobold, SpeakOneLinerConversation());
    AssignCommand(oDrow1, SpeakOneLinerConversation());
    AssignCommand(oKobold, ActionMoveToLocation(lTarget, TRUE));
    ChangeToStandardFaction(oDrow1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oDrow2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oKobold, STANDARD_FACTION_COMMONER);
    AssignCommand(oDrow1, ActionMoveToObject(oKobold, TRUE));
    DelayCommand(1.5, AssignCommand(oDrow2, ActionAttack(oKobold)));

    craft_drop_placeable();

}
