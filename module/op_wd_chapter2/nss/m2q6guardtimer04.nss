//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6GuardTimer04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC leaves the area.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Timer1",60);
    ActionUnequipItem(GetItemPossessedBy(OBJECT_SELF,"NW_WSWSS001"));
}
