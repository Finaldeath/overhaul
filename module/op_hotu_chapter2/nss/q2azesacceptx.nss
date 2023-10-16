///Mark Player as accepting Zesyyr plot
///Give player signet ring

void main()
{
    SetLocalInt(GetModule(), "Zesyyr_Plot",TRUE);
    //Give the player signet ring
    object oPC = GetPCSpeaker();
    CreateItemOnObject("q2amaeviirkey", oPC);
    AddJournalQuestEntry("q2_zesyyr", 20, oPC);
}
