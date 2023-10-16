void main()
{
    int iCount = GetLocalInt(OBJECT_SELF, "Rune_Count");
    SetLocalInt(OBJECT_SELF, "Rune_Count", (iCount + 1));
}
