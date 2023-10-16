//::///////////////////////////////////////////////
//:: m2q3E Mary O'Deel Action Script #1
//:: m2q3E_MaryA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets her "talked to" to TRUE.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_HEARTBEAT",1);
    SetLocalInt(OBJECT_SELF, "TalkedTo", TRUE);
}
