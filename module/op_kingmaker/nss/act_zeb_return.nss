//::///////////////////////////////////////////////
//:: Zebulun Returns
//:: act_zeb_return
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zebulun returns to Yenna
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oYenna = GetObjectByTag("q2_yenna");
    SetLocalInt(GetModule(), "OS_YENNA_ZEBULON",20);
    //put in some sort of visual effect here later
    ActionJumpToObject(oYenna);
}
