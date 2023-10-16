// Sanity check: make sure the "statue" faction is still neutral to pc

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    object oArmor = GetNearestObjectByTag("q4b_armor");
    int nRep1 = GetReputation(oPC, oArmor);
    int nRep2 = GetReputation(oArmor, oPC);

    int nRepChange1 = 50 - nRep1;
    int nRepChange2 = 50 - nRep2;

    if(nRepChange1 > 0)
        AdjustReputation(oPC, oArmor, nRepChange1);
    if(nRepChange2 > 0)
        AdjustReputation(oArmor, oPC, nRepChange2);
}
