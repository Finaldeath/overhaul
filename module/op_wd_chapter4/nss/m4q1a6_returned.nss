//::///////////////////////////////////////////////
//:: M4Q1A6_RETURNED
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the module so it says that Leesa has been returned and she will not follow you.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 15, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE",2);
}
