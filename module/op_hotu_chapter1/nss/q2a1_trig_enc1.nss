//::///////////////////////////////////////////////
//:: Name: q2a1_trig_enc1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When crossed - this trigger signals 2 guards to run
    up to the PC and warn them of some enemy around the
    corner.  They also suggest getting reenforcements.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 14/03
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        object oPC = GetEnteringObject();
        if (GetIsPC(oPC))
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            object oGuard1 = GetObjectByTag("q2a1_fight2_1");
            object oGuard2 = GetObjectByTag("q2a1_fight2_2");
            AssignCommand(oGuard1, ActionMoveToObject(oPC, TRUE));
            AssignCommand(oGuard2, ActionMoveToObject(oPC, TRUE));
            AssignCommand(oGuard1, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE));
            AssignCommand(oGuard1, ActionUnequipItem(GetItemPossessedBy(oGuard1, "NW_ARHE004")));
            AssignCommand(oGuard1, ActionStartConversation(oPC));
        }
    }
}
