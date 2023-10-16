void main()
{
    if (GetLocalInt(OBJECT_SELF, "N_DO_BOOK_GEN") == 0)
    {
        SetLocalInt(OBJECT_SELF, "N_DO_BOOK_GEN", 1);

        int nFirst = 1;
        int nLast = 7;
        int nRand;

        // Generate 1 or 2 books
        int nNumbBooks = Random(1) + 1;

        // 33 % chance of an extra book (up to 3)
        if (Random(2) == 0)
            nNumbBooks++;

        while (nNumbBooks > 0)
        {
            string sBook;

            nRand = Random(nLast) + nFirst;

            sBook = "it_misc_book_00" + IntToString(nRand);

            CreateItemOnObject(sBook);

            nNumbBooks--;
        }
    }
}
