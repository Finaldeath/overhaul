void main()
{
    object oPC = GetPCSpeaker();

    AddJournalQuestEntry("M1Q5_Begg_3a", 20, oPC);
    SetLocalInt(GetModule(),"NW_G_M1Q5JemanieSpokenToXXX", 10);

}

