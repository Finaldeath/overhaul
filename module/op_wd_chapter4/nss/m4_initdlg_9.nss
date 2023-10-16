//::///////////////////////////////////////////////
//:: M4_INITDLG_9.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Saves the object Id of the NPC
this is used in the trigger onExit script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May (using Aidan's Script)
//:: Created On: February 28, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + GetTag(OBJECT_SELF),OBJECT_SELF);
}
