void main()
{
    object oPC = GetPCSpeaker();

    object oThrone = GetNearestObjectByTag("PT_SEEING_STONE_CHAIR", oPC);

    AssignCommand(oPC, ActionSit(oThrone));
}
