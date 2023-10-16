//::///////////////////////////////////////////////
//:: Undrentide WishingWell (OnOpen)
//:: op_wishwell.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn in a random gem for the Wishing Wells
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 25,2003
//:://////////////////////////////////////////////

void main()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
    if (bDoOnce == FALSE)
    {
        //Flag the DoOnce
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);

        //Determine the number of gems in the well.
        int iMaxGems = Random(3);
        int iNumGems = 0;
        string sGem;
        int iGemType;
        while (iNumGems < iMaxGems)
        {
            //Select book
            iGemType = Random(13)+1;
            switch (iGemType)
            {
                case 1:
                    sGem = "nw_it_gem013";
                    break;
                case 2:
                    sGem = "nw_it_gem003";
                    break;
                case 3:
                    sGem = "nw_it_gem014";
                    break;
                case 4:
                    sGem = "nw_it_gem002";
                    break;
                case 5:
                    sGem = "nw_it_gem009";
                    break;
                case 6:
                    sGem = "nw_it_gem015";
                    break;
                case 7:
                    sGem = "nw_it_gem011";
                    break;
                case 8:
                    sGem = "nw_it_gem001";
                    break;
                case 9:
                    sGem = "nw_it_gem007";
                    break;
                case 10:
                    sGem = "nw_it_gem004";
                    break;
                case 11:
                    sGem = "nw_it_gem010";
                    break;
                case 12:
                    sGem = "nw_it_gem005";
                    break;
                case 13:
                    sGem = "nw_it_msmlmisc20";
                    break;
            }

            //Create Gem
            CreateItemOnObject(sGem);

            //Update loop variables
            iNumGems++;
        }
    }
}
