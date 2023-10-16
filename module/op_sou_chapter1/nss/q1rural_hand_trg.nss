//::///////////////////////////////////////////////
//:: Name q1rural_hand_trg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The first time a PC enters this trigger with
    the mummified hand - send a message to the PC
    (to try and get them to use it)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 16/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        if (GetIsObjectValid(GetItemPossessedBy(oPC, "mummifiedhand")))
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            FloatingTextStrRefOnCreature(76455, oPC, FALSE);
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 1.0, 2.0));
        }
    }
}
