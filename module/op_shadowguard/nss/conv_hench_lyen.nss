int StartingConditional()
{
    object oPC = GetPCSpeaker();

    object oHench = GetHenchman(oPC);

    if (GetTag(oHench) == "HENCH_LYEN")
    {
        AssignCommand(oHench, JumpToObject(oPC));
        return TRUE;
    }
    return FALSE;
}
