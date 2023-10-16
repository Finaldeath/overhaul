//::///////////////////////////////////////////////
//:: Name q3b_ent_earthped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Track when PCs enter and exit this trigger
    for use in its heartbeat event
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  April 4/03
//:://////////////////////////////////////////////

void main()
{
    //Setcount of PCs in area..
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "X1_Q3B_NUMPC", GetLocalInt(OBJECT_SELF, "X1_Q3B_NUMPC") + 1);
    }
}
