void main()
{
if (GetLocalInt(OBJECT_SELF,"DOONCE") == 0)
{
            SpeakString("You are cheating.  This chest contains all plot items.");
             CreateItemOnObject("M3Q3_A02VAATH", GetLastOpenedBy());
             CreateItemOnObject("M3Q1A07WRIT", GetLastOpenedBy());
        CreateItemOnObject("M3Q3_A02GUZUD", GetLastOpenedBy());
        CreateItemOnObject("M3Q3_A02OBOUL", GetLastOpenedBy());
        CreateItemOnObject("NW_AARCL013", GetLastOpenedBy());


        // * books
        CreateItemOnObject("M3Q1A09TOMEOFBOO", GetLastOpenedBy());
        CreateItemOnObject("M3Q1A09TOMEOFAMU", GetLastOpenedBy());
        CreateItemOnObject("M3Q1A09TOMEOFROB", GetLastOpenedBy());
        CreateItemOnObject("M3Q1A09TOMEOFRIN", GetLastOpenedBy());
        CreateItemOnObject("M3Q1A09TOMEOFPOW", GetLastOpenedBy());

    // * words of power
    CreateItemOnObject("M3Q1_WORDPOWER1");
    CreateItemOnObject("M3Q1_WORDPOWER2");
    CreateItemOnObject("M3Q1_WORDPOWER3");
    SetLocalInt(OBJECT_SELF,"DOONCE",1);
}

}
