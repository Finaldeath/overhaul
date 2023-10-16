// Failing to open gate - stop henchmen and associates from bashing it.

void main()
{
    object oPC = GetClickingObject();

    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oDominate = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

    if(oAnimal != OBJECT_INVALID) AssignCommand(oAnimal, ClearAllActions());
    if(oFamiliar != OBJECT_INVALID) AssignCommand(oFamiliar, ClearAllActions());
    if(oSummon != OBJECT_INVALID) AssignCommand(oSummon, ClearAllActions());
    if(oDominate != OBJECT_INVALID) AssignCommand(oDominate, ClearAllActions());

    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        AssignCommand(oHench, ClearAllActions());
        i++;
        oHench = GetHenchman(oPC, i);
    }

}
