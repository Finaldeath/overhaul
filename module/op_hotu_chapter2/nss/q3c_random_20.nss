//::///////////////////////////////////////////////
//:: Q3 (Ch2 Dracolich Suplot)
//:: Randomize 20 (Condition Script)
//:: Q3c_Random_20.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Saves out a random integer between 1 and 20.
     Returns FALSE.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 18, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nRandom = Random(20)+1;
    SetLocalInt(OBJECT_SELF, "nRandom", nRandom);

    return FALSE;
}


