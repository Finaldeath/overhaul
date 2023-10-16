// katrian talks with pc

void DoKatrianaTalk(object oPC)
{
     // katriana init dialog with pc (only once)
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_KATRIANA_TALK_ONCE");
    if(nDoOnce == 1)
        return;
    object oKatriana = GetObjectByTag("Q1_KATRIANA");
    SetLocalInt(OBJECT_SELF, "DO_KATRIANA_TALK_ONCE", 1);
    DelayCommand(1.5, AssignCommand(oKatriana, ActionStartConversation(oPC)));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC)) // should be also for DMs
        return;

    DoKatrianaTalk(oPC);
    // jumping players to the right starting point:
    int bBeenInOasis = GetLocalInt(oPC, "X1_ENTRED_OASIS");
    int bBeenIsRestoredOasis = GetLocalInt(oPC, "X1_ENTRED_OASIS2");
    int bBeenInArchCamp = GetLocalInt(oPC, "X1_ENTRED_AO_CAMP");
    if(bBeenInOasis == 1 || bBeenInArchCamp == 1 || bBeenIsRestoredOasis == 1) // not a new player - need to do nothing with this one
        return;
    // get the new start point
    object oWP = GetLocalObject(GetModule(), "X1_CURRENT_START");
    if(oWP == OBJECT_INVALID)
        return;
    AssignCommand(oPC, JumpToObject(oWP));


}
