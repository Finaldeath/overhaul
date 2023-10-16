//::///////////////////////////////////////////////
//:: M4_SITDRINK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the NPC to not sitting and not drinking.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 12, 2002
//:://////////////////////////////////////////////
void main()
{
//    SetLocalInt(OBJECT_SELF, "NW_M4_SITDRINK", FALSE);
    SetLocalInt(OBJECT_SELF, "NW_M4_DRINK", FALSE);
}
