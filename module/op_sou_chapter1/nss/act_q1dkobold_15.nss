//::///////////////////////////////////////////////
//:: Name act_q1dkobold_15
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The kobolds give the PC a reward for killing
    off the commoners
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 13/03
//:://////////////////////////////////////////////

void main()
{
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF, "q1dhulcdagger"), GetPCSpeaker());
}
