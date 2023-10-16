//::///////////////////////////////////////////////
//:: HeartBeat
//:: m2q3HellHound_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The hell hounds run out of the room when the
    chest is opened.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: December 7, 2001
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_HellChest") == 10 &&
        GetLocalInt(OBJECT_SELF,"NW_L_Move") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Move",10);
        ActionMoveToObject(GetObjectByTag("M2Q03PHELLCHEST"),TRUE);
    }
}
