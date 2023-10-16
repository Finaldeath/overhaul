void main()
{
    if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
    {
        int i;
        string s;
        object o;

        for (i = 1; i <= 25; i++)
        {
            if (i < 10)
                s = "IT_MISC_BOOK_00" + IntToString(i);

            else if (i < 99)
                s = "IT_MISC_BOOK_0" + IntToString(i);

            else
                s = "IT_MISC_BOOK_" + IntToString(i);

            o = CreateItemOnObject(s, OBJECT_SELF);

            if (GetTag(o) != s)
                SendMessageToPC(GetFirstPC(), "[Problem with Book " + IntToString(i) + "]");
        }

        o = GetFirstItemInInventory();

        while (o != OBJECT_INVALID)
        {
            SetLocalString(o, "S_BELONGED_TO", GetTag(OBJECT_SELF));

            o = GetNextItemInInventory();
        }

        SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
    }
}
