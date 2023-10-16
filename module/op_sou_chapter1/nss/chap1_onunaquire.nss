//::///////////////////////////////////////////////
//:: Name: chap1_onunaquire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Chapter 1 - On UnAquire Item
*/
//:://////////////////////////////////////////////
//:: Created By: Keith warner
//:: Created On: Mar 3/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetModuleItemLostBy();
    object oItem = GetModuleItemLost();
    //prevent the baby dropping exploit
    if (GetIsPC(oPC) == TRUE)
    {
        if (GetTag(oItem) == "q1hbaby")
        {
            if (IsInConversation(oPC) == TRUE)
            {
                DestroyObject(oItem);
                CreateItemOnObject("q1hbaby", oPC);
                SetLocalInt(GetModule(), "X1_PCRescuedQ1HBaby", 1);
                FloatingTextStrRefOnCreature(40418, oPC);
            }

            SetLocalInt(GetModule(), "X1_Q1HPCHASBABY", 0);
        }
    }
}
