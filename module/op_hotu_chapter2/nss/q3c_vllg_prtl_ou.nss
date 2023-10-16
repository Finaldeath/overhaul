// teleporta pc back to village

void main()
{
    object oPC = GetLastUsedBy();
    object oTarget = GetObjectByTag("Q3B_PORTAL_VILLAGE_TO_DOMAIN");
    AssignCommand(oPC, JumpToObject(oTarget));
}
