void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oWell = GetObjectByTag("WP_Well");

    DelayCommand(1.0, AssignCommand(oPC, ActionJumpToObject(oWell)));
    DelayCommand(1.0, AssignCommand(oHenchman, ActionJumpToObject(oWell)));
    DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToObject(oWell)));
    DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToObject(oWell)));
}
