//::///////////////////////////////////////////////
//:: Sleeping Man, Dream State 3 (Action Script)
//:: H3a_SMan_Dream3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sets the Sleeping Man's Dream State variable
     to 3.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

void main()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    SetLocalInt(oMan, "iDreamState", 3);
}

