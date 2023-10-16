//::///////////////////////////////////////////////
//:: Feran resigns
//:: act_fer_ellyhate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran resigns
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

void main()
{
//Feran leaves and is replaced by guard with "q2_mgreplace" dialogue
    object oWay = GetNearestObjectByTag("q2_way_ferexit");
    object oWay2 = GetObjectByTag("q2ca_feran_office");
    location lWay = GetLocation(oWay2);
    object oLamp = GetObjectByTag("q2_lamplighter");
    SetLocalInt(GetFirstPC(), "OS_FERAN_GONE",10);
    CreateObject(OBJECT_TYPE_CREATURE,"q2_mgreplace",lWay);
    ActionMoveToObject(oWay);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
