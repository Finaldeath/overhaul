//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6SickLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sickfinger leaves the area.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 15, 2001
//:://////////////////////////////////////////////

void main()
{
    ActionForceMoveToObject(GetWaypointByTag("WP_SICKEXIT"));
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
