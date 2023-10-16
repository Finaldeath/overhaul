void main()
{
    if(GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q6F2_GuardActive") == TRUE)
    {
        int nNth = 1;
        object oGuard = GetObjectByTag("M1Q6F06Helm_Guard" +IntToString(nNth));
        object oPC = GetLastUsedBy();
        AdjustReputation(oPC,oGuard,-100);
        while(GetIsObjectValid(oGuard))
        {
            AssignCommand(oGuard,ActionAttack(oPC));
            nNth++;
            oGuard = GetObjectByTag("M1Q6F06Helm_Guard" +IntToString(nNth));

        }
    }
}
