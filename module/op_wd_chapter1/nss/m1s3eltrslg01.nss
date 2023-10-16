void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC,"NW_L_M1S3Tests",10);

    AddJournalQuestEntry("m1q1_Cloaktower", 10, oPC);
}
