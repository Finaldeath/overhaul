//::///////////////////////////////////////////////
//:: Captain Jord Conversation Script #1
//:: Jord01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Captain Jord to move to the "Below
    Decks" waypoint and destroy himself.
*/
//:://////////////////////////////////////////////

void main()
{
    object oBelowDecks = GetObjectByTag("BelowDecks");

    ActionMoveToObject(oBelowDecks, TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
