// * Grovel initiates with the player

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nGrovelTalk") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        //Fairy Monitor will talk with the first PC down to Undermountain
        BlackScreen(oPC);
        FadeFromBlack(oPC);
        object oMonitor = GetObjectByTag("q2bgrovel");
        DelayCommand(1.0, AssignCommand(oMonitor, ActionStartConversation(oPC)));
        SetLocalInt(OBJECT_SELF, "nGrovelTalk", 1);
    }
}
