// Tymofarrar takes the stick

void main()
{
    object oPC = GetPCSpeaker();
    object oRod = GetItemPossessedBy(oPC, "q5rodofrule");
    if (GetIsObjectValid(oRod))
    {
        ActionPauseConversation();
        ActionTakeItem(oRod, oPC);
        ActionDoCommand(DestroyObject(oRod));
        CreateItemOnObject("nw_it_mbracer002", oPC);
        ActionResumeConversation();
    }
}
