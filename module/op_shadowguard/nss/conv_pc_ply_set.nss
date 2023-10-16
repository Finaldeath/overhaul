void main()
{
    object oPC = GetPCSpeaker();

    object oChair = GetNearestObjectByTag("PT_PC_SITTING_CHAIR", oPC);

    AssignCommand(oPC, ActionSit(oChair));

    SetLocalInt(oPC, "N_PLAYING_CARDS", 1);
}
