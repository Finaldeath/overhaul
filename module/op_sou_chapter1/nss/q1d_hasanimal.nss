// check to see if the PC has a Companion, Familiar or Summoned Creature

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);

    if ((GetIsObjectValid(oCompanion)) ||
       (GetIsObjectValid(oFamiliar)) ||
       (GetIsObjectValid(oSummon)))
    {
        return TRUE;
    }
    return FALSE;
}
