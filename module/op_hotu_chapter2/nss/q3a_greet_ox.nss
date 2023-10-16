// Cordigan the gnome greets the player

void main()
{
    object oPC = GetExitingObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oGnome = GetNearestObjectByTag("q3_cordigan");
    AssignCommand(oGnome, ClearAllActions());
    AssignCommand(oGnome, ActionStartConversation(oPC));

}
