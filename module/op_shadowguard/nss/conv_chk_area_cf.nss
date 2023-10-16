int StartingConditional()
{
    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetTag(o) == "CT_COMM_CF_FOLL")
            return TRUE;

        o = GetNextObjectInArea();
    }

    return FALSE;
}
