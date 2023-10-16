//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3NoMoreFire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The greater fire elemental can no longer be
    summoned.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: December 10, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_SummonGreaterFire",10);
    DestroyObject(OBJECT_SELF);
}
