//::///////////////////////////////////////////////
//:: Stone Butler (Condition - Emporium)
//:: C_Butler_Emp_N.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Player has heard the guardian golems advertise
     their maker.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 26, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bEmporium = GetLocalInt(oPC, "bGolemEmporium");

    if (bEmporium == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
