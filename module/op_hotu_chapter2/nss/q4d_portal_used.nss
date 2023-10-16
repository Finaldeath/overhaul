// Portal to demilich

void main()
{
    object oPC = GetLastUsedBy();
    object oTarget = GetObjectByTag("q4b_portal");
    AssignCommand(oPC, JumpToObject(oTarget));
}
