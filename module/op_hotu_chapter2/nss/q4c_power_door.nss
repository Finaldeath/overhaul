// Guard inits dialog

void main()
{
    object oPC = GetClickingObject();
    if(oPC == OBJECT_INVALID)
        oPC = GetEnteringObject();
    object oGolem = GetObjectByTag("q4c_flesh_guard");
    AssignCommand(oGolem, ActionStartConversation(oPC));

    // make sure henchmen don't try to bash to door
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        AssignCommand(oHench, ClearAllActions());
        i++;
        oHench = GetHenchman(oPC, i);
    }
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    AssignCommand(oAnimal, ClearAllActions());
    object oDominate = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    AssignCommand(oDominate, ClearAllActions());
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    AssignCommand(oFamiliar, ClearAllActions());
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    AssignCommand(oSummon, ClearAllActions());
}
