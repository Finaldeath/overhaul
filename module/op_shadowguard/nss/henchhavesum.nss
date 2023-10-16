int StartingConditional()
{
    object oAss = GetAssociate(ASSOCIATE_TYPE_SUMMONED,GetPCSpeaker());

    if (oAss == OBJECT_INVALID) return FALSE;

    return TRUE;
}
