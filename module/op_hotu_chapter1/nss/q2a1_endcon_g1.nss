//::///////////////////////////////////////////////
//:: Name q2a1_endcon_g1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    At the end of encounter guard 1's conversation,
    he and his companion will run and wait for the
    PCs at the entrance to the street that has
    the enemies in it.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 14/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nPosted") != 1)
    {
        object oGuard1 = GetObjectByTag("q2a1_fight2_1");
        object oGuard2 = GetObjectByTag("q2a1_fight2_2");
        AssignCommand(oGuard1, ActionMoveToObject(GetObjectByTag("wp_q2a1_ambient4")));
        AssignCommand(oGuard2, ActionMoveToObject(GetObjectByTag("wp_q2a1_ambient4")));
        SetLocalInt(oGuard1, "nPosted", 1);
        SetLocalInt(oGuard2, "nPosted", 1);
    }
}
