void main()
{
    object oDestination = GetLocalObject(OBJECT_SELF, "O_COLLABORATOR");

    location l = GetLocation(oDestination);

    object oPC = GetPCSpeaker();

    AssignCommand(oPC, JumpToLocation(l));

    object o;

    o = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);

    if (o != OBJECT_INVALID)
        AssignCommand(o, JumpToLocation(l));

    o = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

    if (o != OBJECT_INVALID)
        AssignCommand(o, JumpToLocation(l));

    o = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);

    if (o != OBJECT_INVALID)
        AssignCommand(o, JumpToLocation(l));

    o = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);

    if (o != OBJECT_INVALID)
        AssignCommand(o, JumpToLocation(l));

    o = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);

    if (o != OBJECT_INVALID)
        AssignCommand(o, JumpToLocation(l));

}
