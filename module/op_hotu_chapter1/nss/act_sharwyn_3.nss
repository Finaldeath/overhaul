//::///////////////////////////////////////////////
//:: Name act_sharwyn_3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Sharwyn becomes hostile
runs to the well and disappears permanently
(unless the player kills her first)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 16/03
//:://////////////////////////////////////////////

void main()
{

    object oTarget = GetWaypointByTag("wp_level1_ypexit");
    ActionForceMoveToObject(oTarget, TRUE, 1.0, 9.0);
    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
    DestroyObject(OBJECT_SELF, 10.0);
}
