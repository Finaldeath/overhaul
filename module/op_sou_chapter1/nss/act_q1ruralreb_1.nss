//::///////////////////////////////////////////////
//:: Name act_q1ruralreb_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set variable on player that next time he leaves
    the cave - if Rumgut is still alive (and not
    drunk/asleep) - rebecca will cook a meal for him
    and kill Rumgut.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "X1_Q1RuralRebPoison", 1);
}
