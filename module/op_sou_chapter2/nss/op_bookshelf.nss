//::///////////////////////////////////////////////
//:: Undrentide Bookshelf (OnOpen)
//:: Op_Bookshelf.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn in an Undrentide-specific book.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 9,2003
//:://////////////////////////////////////////////

void main()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
    if (bDoOnce == FALSE)
    {
        //Flag the DoOnce
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);

        //Determine the number of books on the shelf.
        int iMaxBooks = Random(3);
        int iNumBooks = 0;
        string sBook;
        int iBookType;
        string sNoDup1;
        string sNoDup2;
        string sNoDup3;
        while (iNumBooks < iMaxBooks)
        {
            //Select book
            iBookType = Random(12)+1;
            switch (iBookType)
            {
                case 1:
                    sBook = "cityofshadows";
                    break;
                case 2:
                    sBook = "mechanicsflight";
                    break;
                case 3:
                    {
                        //Only give out the Mythal Guide once.
                        int bMythalBook = GetLocalInt(GetModule(), "bMythalBook");
                        if (bMythalBook == FALSE)
                        {
                            sBook = "mythalguide";
                            SetLocalInt(GetModule(), "bMythalBook", TRUE);
                        }
                        else
                        {
                            sBook = "artoflichdom";
                        }
                    }
                    break;
                case 4:
                    sBook = "artoflichdom";
                    break;
                case 5:
                    sBook = "poetryoffilth";
                    break;
                case 6:
                    {
                        //Only give out the Temple Rites once.
                        int bRitesBook = GetLocalInt(GetModule(), "bRitesBook");
                        if (bRitesBook == FALSE)
                        {
                            sBook = "templerites";
                            SetLocalInt(GetModule(), "bRitesBook", TRUE);
                        }
                        else
                        {
                            sBook = "cityofshadows";
                        }
                    }
                    break;
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                    sBook = "moldytome";
                    break;
            }

            //Check for duplicates
            sNoDup1 = GetLocalString(OBJECT_SELF, "sNoDup1");
            sNoDup2 = GetLocalString(OBJECT_SELF, "sNoDup2");
            sNoDup3 = GetLocalString(OBJECT_SELF, "sNoDup3");
            if (sBook != "" &&
                sBook != "moldytome")
            {
                if (sBook == sNoDup1 ||
                    sBook == sNoDup2 ||
                    sBook == sNoDup3)
                {
                    sBook == "moldytome";
                }
            }

            //Create book
            CreateItemOnObject(sBook);

            //Set the duplicate-tracking local
            SetLocalString(OBJECT_SELF, "sNoDup"+IntToString(iNumBooks+1), sBook);

            //Update loop variables
            iNumBooks++;
        }
    }
}
