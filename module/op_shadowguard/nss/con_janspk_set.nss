// Set that the the NPC students have talked to the PC before
void main()
{
    object oModule = GetModule();

    SetLocalInt(oModule, "ALTER_SPOKEN_BEFORE", TRUE);
}
