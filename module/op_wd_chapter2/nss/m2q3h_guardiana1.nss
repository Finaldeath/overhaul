//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #1
//:: m2q3H_GuardianA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the "TalkedTo" local to TRUE, preventing
    the guardian from saying this line again.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "TalkedTo", TRUE);
}
