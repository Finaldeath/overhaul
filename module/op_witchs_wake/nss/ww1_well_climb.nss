void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oAnimalCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oRope = GetObjectByTag("WP_Rope");

    DelayCommand(1.0, AssignCommand(oPC, ActionJumpToObject(oRope)));
    DelayCommand(1.0, AssignCommand(oHenchman, ActionJumpToObject(oRope)));
    DelayCommand(1.0, AssignCommand(oFamiliar, ActionJumpToObject(oRope)));
    DelayCommand(1.0, AssignCommand(oAnimalCompanion, ActionJumpToObject(oRope)));
}
