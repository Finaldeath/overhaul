void main()
{
    int nLocal = GetLocalInt(OBJECT_SELF, "ARKLEM_PLOT");
    if(nLocal < 3)
    {
        SetLocalInt(OBJECT_SELF, "ARKLEM_PLOT", 2);
    }
}
