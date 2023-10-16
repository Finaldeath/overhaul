// Ayala takes whatever herbs the PC has.

void main()
{
    object oPC = GetPCSpeaker();
    object oItem1 = GetItemPossessedBy(oPC, "q1cureing1");
    object oItem2 = GetItemPossessedBy(oPC, "q1cureing2");
    object oItem3 = GetItemPossessedBy(oPC, "q1cureing3");

    ActionPauseConversation();


    if (GetIsObjectValid(oItem1))
    {
        AssignCommand(OBJECT_SELF, ActionTakeItem(oItem1, oPC));
    }

    if (GetIsObjectValid(oItem2))
    {
        AssignCommand(OBJECT_SELF, ActionTakeItem(oItem2, oPC));
    }

    if (GetIsObjectValid(oItem3))
    {
        AssignCommand(OBJECT_SELF, ActionTakeItem(oItem3, oPC));
    }
    AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 1.5));
    DelayCommand(2.0, ActionResumeConversation());
    SetLocalInt(OBJECT_SELF, "nDroganHerbsTaken", 1);
}
