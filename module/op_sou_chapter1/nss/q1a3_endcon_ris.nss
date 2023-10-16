
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nFetchingItems") != 1)
        SetLocalInt(GetObjectByTag("Riisi"), "nWantTalkToPC", 0);
    else
        SetLocalInt(GetObjectByTag("Riisi"), "nWantTalkToPC", 1);
}
