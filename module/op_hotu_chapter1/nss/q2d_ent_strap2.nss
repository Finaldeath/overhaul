//::///////////////////////////////////////////////
//:: Name: q2d_ent_strap2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Activate Special Trap 2 when a PC enters
        this trigger
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Nov 20/02
//:://////////////////////////////////////////////


void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC))
    {
        if (GetLocalInt(GetModule(), "X2_nSTRAP2DESTROYED") != 1)
            SetLocalInt(GetModule(), "nSpecTrap2Active", 1);
    }
}
