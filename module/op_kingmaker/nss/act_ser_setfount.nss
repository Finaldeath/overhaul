//::///////////////////////////////////////////////
//:: Sets Alias at the Fountains at Start
//:: act_ser_setfount
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets Alias at the fountain at your first conversation with her
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_DESTINATION",10);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_LASTDEST",10);
}
