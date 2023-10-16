int StartingConditional()
{
    object oAss = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,GetPCSpeaker());

    if (oAss == OBJECT_INVALID) return FALSE;

    return TRUE;
}
