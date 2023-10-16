// abort of bebelith appearance cutscene

void main()
{
    object oPC = GetFirstPC();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    object oBeholder = GetObjectByTag("q5_beholder_body");
    object oBebelith = GetObjectByTag("q5c_bebelith");
    object oWP = GetObjectByTag("q5c_bebelith_walkto");
    DestroyObject(oBeholder);
    AssignCommand(oBebelith, JumpToObject(oWP));
    AssignCommand(oBebelith, SetFacingPoint(GetPosition(oPC)));
    AdjustReputation(oPC, oBebelith, -50);
    AdjustReputation(oBebelith, oPC, -50);
}
