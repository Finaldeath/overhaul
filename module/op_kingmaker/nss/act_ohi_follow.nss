//::///////////////////////////////////////////////
//:: Ohio Follows
//:: act_ohi_follow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ohio is set to follow the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    SetLocalInt(OBJECT_SELF,"OS_OHIO_FOLLOW",10);
    SetLocalObject(OBJECT_SELF,"OS_FOLLOW",oPC);
}
