//::///////////////////////////////////////////////
//:: M2Q2E_OPENDOOR.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dregin opens the door for the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 11, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_OpenedDoor") == 0)
    {
        ActionPauseConversation();
        ActionOpenDoor(GetObjectByTag("M2Q2E_BRIDGEDR"));
        ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_L_OpenedDoor",1));
        ActionForceMoveToObject(GetWaypointByTag("WP_DREGIN"));
        ActionResumeConversation();
    }
}
