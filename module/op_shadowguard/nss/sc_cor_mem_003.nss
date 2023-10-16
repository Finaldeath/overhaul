void main()
{
    object oPC = GetPCSpeaker();

    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM", oPC);

    object oWP = GetNearestObjectByTag("WP_CP_COR_MEM_MOVE", oPC);

    AssignCommand(oCP, ActionMoveToObject(oWP));
}
