void main()
{
    object oPC = GetLastKiller();

    object oNilmaldor = GetNearestObjectByTag("Q2_NILMALDOR");
    AdjustReputation(oPC, oNilmaldor, -100);
    AdjustReputation(oNilmaldor, oPC, -100);
    AssignCommand(oNilmaldor, ActionAttack(oPC));
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 2);

}
