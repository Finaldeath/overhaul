//::///////////////////////////////////////////////
//:: Name : act_wguard_talk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set warning guard as having been talked to once.
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 3/02
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "nTalkedTo", 1);
}