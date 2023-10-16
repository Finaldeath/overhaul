//Have fairy monitor talk to PC when he enters the trigger
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        object oMonitor = GetObjectByTag("q2bgrovel");
        AssignCommand(oMonitor, ActionStartConversation(oPC));
        DestroyObject(OBJECT_SELF);
    }
}
