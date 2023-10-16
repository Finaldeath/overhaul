//::///////////////////////////////////////////////
//:: Name  q2d1_endcon_gate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Mindflayer and his two thralls will return to
    their posts..

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 30/03
//:://////////////////////////////////////////////

void main()
{
    //Have the three walk back to their posts..
    object oGatekeeper = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    object oThug1 = GetObjectByTag("q2dthrallshock1a");
    object oThug2 = GetObjectByTag("q2dthrallshock1b");
    object oPost1 = GetWaypointByTag("wp_q2dgatekeeper_post");
    object oPost2 = GetWaypointByTag("wp_q2dthrallshock1a_post");
    object oPost3 = GetWaypointByTag("wp_q2dthrallshock1b_post");


    AssignCommand(oGatekeeper, ActionMoveToObject(oPost1));
    AssignCommand(oThug1, ClearAllActions());
    AssignCommand(oThug2, ClearAllActions());
    AssignCommand(oThug1, ActionForceMoveToObject(oPost3, FALSE, 1.0, 7.0));
    AssignCommand(oThug2, ActionForceMoveToObject(oPost2, FALSE, 1.0, 7.0));

    AssignCommand(oGatekeeper, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
    AssignCommand(oThug1, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
    AssignCommand(oThug2, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
}
