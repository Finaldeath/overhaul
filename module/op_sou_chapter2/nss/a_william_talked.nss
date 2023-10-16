//::///////////////////////////////////////////////
//:: Sir William Rey (Action - Talked)
//:: A_William_Talked.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag Sir William as having completed his
     offer to join.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 22, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "Library_03b_bTalkedTo", TRUE);
}
