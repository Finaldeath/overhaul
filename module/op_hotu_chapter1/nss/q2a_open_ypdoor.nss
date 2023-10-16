//::///////////////////////////////////////////////
//:: Name: q2a_open_ypdoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set Local Int for Mhaere's conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 27/02
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "nYPAttackOn") == 2)
    {
        SetLocalInt(GetModule(), "nYPAttackOn", 3);
    }
}
