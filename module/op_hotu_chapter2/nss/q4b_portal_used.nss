// Portal to demilich

void main()
{
    object oPC = GetLastUsedBy();
    object oTarget = GetObjectByTag("q4d_portal");
    AssignCommand(oPC, JumpToObject(oTarget));
}
