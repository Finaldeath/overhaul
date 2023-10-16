//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Randomize 6 (Condition Script)
//:: Q3c_Random_6.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Saves out a random integer between 1 and 6.
     Returns FALSE.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nRandom = Random(6)+1;
    SetLocalInt(OBJECT_SELF, "nRandom", nRandom);

    return FALSE;
}

