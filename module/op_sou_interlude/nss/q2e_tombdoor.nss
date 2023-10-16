// making sure a player is not entering as a possessed familiar and locking himself outside.

void main()
{
    object oPC = GetLastOpenedBy();
    if (GetIsPossessedFamiliar(oPC) == TRUE)
    {
        object oMaster = GetMaster(oPC);
        UnpossessFamiliar(oPC);
        DelayCommand(1.5, FloatingTextStrRefOnCreature(40524, oMaster, FALSE));
        AssignCommand(OBJECT_SELF, ActionCloseDoor(OBJECT_SELF));
        return;
    }
}
