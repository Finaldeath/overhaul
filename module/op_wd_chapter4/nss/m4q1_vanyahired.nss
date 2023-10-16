//::///////////////////////////////////////////////
//:: M4Q1_VANYAHIRED
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that you've hired Vanya, and who you are.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 8, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_HIRED",10);
    SetLocalObject(OBJECT_SELF,"NW_L_HIREDBY",GetPCSpeaker());
}
