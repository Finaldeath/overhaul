//::///////////////////////////////////////////////
//:: M4Q1_VANYAFIRED
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that she's been fired so she won't follow
    you around.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 8, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_HIRED",99);
    SetLocalObject(OBJECT_SELF,"NW_L_HIREDBY",OBJECT_INVALID);
//    ActionMoveToObject(GetObjectByTag("WP_VANYA_START"));
}
