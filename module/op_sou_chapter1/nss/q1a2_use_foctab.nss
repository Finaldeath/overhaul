//::///////////////////////////////////////////////////
//:: q1a2_use_foctab
//:: Start a conversation with the user
//:: or open the table's inventory
//::///////////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    if (IsInConversation(oPC) == FALSE)
    {
        ActionStartConversation(oPC);
    }
    else
    {
        OpenInventory(OBJECT_SELF, oPC);
    }
}
