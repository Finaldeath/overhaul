// * Creates a time crystal inside of the chest
void main()
{
    if (GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF, "M3Q2FTIME_CRY")) == FALSE)
    {
        CreateItemOnObject("M3Q2FTIME_CRY", OBJECT_SELF);
    }
}
