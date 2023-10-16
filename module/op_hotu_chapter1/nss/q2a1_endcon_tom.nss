//::///////////////////////////////////////////////
//:: Name: q2a1_endcon_tom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Thomas has given the PC the ring, he will
    dissapear at the end of conversation - otherwise
    he will stick around
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 20/03
//:://////////////////////////////////////////////

void main()
{
   if (GetLocalInt(OBJECT_SELF, "nRingGiven") == 1)
   {

        SetIsDestroyable(TRUE);
        DestroyObject(OBJECT_SELF, 3.0);
        AssignCommand(OBJECT_SELF, ActionRandomWalk());
        SetCommandable(FALSE);
   }
}
