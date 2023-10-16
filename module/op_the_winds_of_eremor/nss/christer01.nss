//::///////////////////////////////////////////////
//:: Christer Conversation Script 01
//:: christer01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Christer moves to the crypt door and destroys
    himself.
*/
//:://////////////////////////////////////////////

void main()
{
    object oCryptWaypoint = GetObjectByTag("WP_Crypts");

    ActionMoveToObject(oCryptWaypoint);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
