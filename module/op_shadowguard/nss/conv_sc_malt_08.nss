void main()
{
    object oPC = GetPCSpeaker();
    object oWP = GetNearestObjectByTag("WP_EXIT");
    object oTarin = GetNearestObjectByTag("HENCH_TARIN");

    RemoveHenchman(oPC, oTarin);
    SetLocalInt(oTarin, "N_DONT_SPEAK", 1);
    AssignCommand(oTarin, ActionMoveToObject(oWP, TRUE));
    DestroyObject(oTarin, 6.0);
}
