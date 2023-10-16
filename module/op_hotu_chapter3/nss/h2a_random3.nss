//::///////////////////////////////////////////////
//:: Random 3 (Action Script)
//:: H2a_Random3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Picks a random number between 1 and 3 and
     saves it out for future reference.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

void main()
{

    // Brad Prince - added sound effects for greeting.
    ExecuteScript("hx_slct_con", OBJECT_SELF);

    int iRandom = Random(3)+1;
    SetLocalInt(OBJECT_SELF, "iRandom", iRandom);
}
