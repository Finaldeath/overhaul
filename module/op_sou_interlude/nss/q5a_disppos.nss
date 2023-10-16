// dispel familiar possession

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPossessedFamiliar(oPC) == TRUE)
    {
        object oMaster = GetMaster(oPC);
        UnpossessFamiliar(oPC);
        DelayCommand(1.5, FloatingTextStrRefOnCreature(40524, oMaster, FALSE));
        return;
     }
}
