//q2_ent_fstrig
//trigger the slaver encounter
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    //DO THIS ONLY THE FIRST TIME A PC ENTERS THE AREA
    //CAUSE THE DUERGAR Slaving party to talk to the PC
    if (GetLocalInt(OBJECT_SELF, "nFirstSlaver") != 1)
    {


        SetLocalInt(OBJECT_SELF, "nFirstSlaver", 1);
        object oDuergarChief = GetObjectByTag("q2firstslaver");
        object oDuergar1 = GetObjectByTag("q2fs_rogue1");
        object oDuergar2 = GetObjectByTag("q2fs_rogue2");
        object oDuergar3 = GetObjectByTag("q2fs_rogue3");

        AssignCommand(oDuergarChief, ActionStartConversation(oPC));
        DelayCommand(1.5, AssignCommand(oDuergar1, ActionMoveToObject(oPC, TRUE, 5.0)));
        DelayCommand(2.0, AssignCommand(oDuergar2, ActionMoveToObject(oPC, TRUE, 7.0)));
        DelayCommand(2.5, AssignCommand(oDuergar3, ActionMoveToObject(oPC, TRUE, 9.0)));
    }

}
