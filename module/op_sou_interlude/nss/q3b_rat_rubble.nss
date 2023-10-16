// whenever the player takes the diamond:
// - create the rat and let it run away
// - destroy the diamond on the player
// - init the dialog

void Talk(object oPC)
{
    BeginConversation("", oPC);
}

void main()
{
    if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        object oDiamond = GetInventoryDisturbItem();
        object oPC = GetLastDisturbed();
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, PlaySound("as_an_ratsqueak1"));
        object oRat = CreateObject(OBJECT_TYPE_CREATURE, "rat002", GetLocation(oPC), TRUE);
        SignalEvent(oRat, EventUserDefined(101));
        object oTalker = GetNearestObjectByTag("Q3B_RAT_TALKER");
        AssignCommand(oTalker, Talk(oPC));
        DestroyObject(oDiamond);

    }
}
