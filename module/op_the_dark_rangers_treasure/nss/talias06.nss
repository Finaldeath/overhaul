//::///////////////////////////////////////////////
//:: Talias Conversation Script #6
//:: Talias06.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the EndReady local for the conversation
    exit script.
*/
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "EndReady", TRUE);
}
