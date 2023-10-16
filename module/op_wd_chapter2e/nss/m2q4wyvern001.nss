//::///////////////////////////////////////////////
//:: Conversation
//:: m2q4Wyvern001
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wyvern leaves.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    ActionMoveAwayFromObject(GetPCSpeaker());
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
