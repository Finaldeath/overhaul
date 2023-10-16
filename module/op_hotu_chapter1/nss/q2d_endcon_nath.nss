//::///////////////////////////////////////////////
//:: Name q2d_endcon_nath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Nathyrra's end conversation script
if her talklevel < 2 she disappears
otherwise she sticks around for the final battle


*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{

    if (GetLocalInt(GetModule(), "X2_Q2DNath_Talklevel") < 3)
    {
        SetIsDestroyable(TRUE);
        DestroyObject(OBJECT_SELF);
    }
    else if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        AddHenchman(GetPCSpeaker(), OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", TRUE);
    }
}
