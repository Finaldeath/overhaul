void main()
{

    object oPC = GetPCSpeaker();
    object oRecharger = OBJECT_SELF;
    object oInventory = GetObjectByTag("q7rechargerinv");
    SetLocalInt(oPC, "X1_Q7InRechargeCon", 1);
    ActionPauseConversation();
    AssignCommand(oPC, ActionPauseConversation());

    AssignCommand(oRecharger, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
    //OpenInventory(oInventory, oPC);
    AssignCommand(oPC, DoPlaceableObjectAction(oInventory, PLACEABLE_ACTION_USE));
    DelayCommand(5.0, ActionResumeConversation());
}
