// making sure a player is not entering as a possessed familiar and locking himself outside.

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPossessedFamiliar(oPC) == TRUE)
    {
        object oMaster = GetMaster(oPC);
        UnpossessFamiliar(oPC);
        DelayCommand(1.5, FloatingTextStrRefOnCreature(40524, oMaster, FALSE));
        object oWP = GetNearestObjectByTag("Q2E_WP_JUMP_FAMILIAR");
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, JumpToObject(oWP));
        return;
    }
}
