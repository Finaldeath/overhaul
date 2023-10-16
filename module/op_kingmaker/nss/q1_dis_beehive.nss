//::///////////////////////////////////////////////
//:: On Inventory Disturbed
//:: q1_dis_beehive
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC takes the poison blade
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oAlias = GetObjectByTag("q2_alias");
    if(GetLocalInt(GetFirstPC(), "OS_HELPDRUID")==15)
    {
        SetLocalInt(GetFirstPC(), "OS_HELPDRUID",20);
    }
}
