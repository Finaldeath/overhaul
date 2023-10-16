//::///////////////////////////////////////////////
//:: Creating Henchmen
//:: q3ai_mw_hencreat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates the spirits of the henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oDeadCal = GetObjectByTag("os_cut_cal");
    object oDeadTrp = GetObjectByTag("os_cut_trp");
    object oDeadKai = GetObjectByTag("os_cut_kai");
    object oDeadJab = GetObjectByTag("os_cut_jab");
//    object oWay1 = GetObjectByTag("q3ai_way_deadcal");
    location lCal = GetLocation(oDeadCal);
    CreateObject(OBJECT_TYPE_CREATURE,"os_dead_cal",lCal);
//    object oWay2 = GetObjectByTag("q3ai_way_deadtrp");
    location lTrp = GetLocation(oDeadTrp);
    CreateObject(OBJECT_TYPE_CREATURE,"os_dead_trip",lTrp);
//    object oWay3 = GetObjectByTag("q3ai_way_deadjab");
    location lJab = GetLocation(oDeadJab);
    CreateObject(OBJECT_TYPE_CREATURE,"os_dead_jab",lJab);
    object oWay4 = GetObjectByTag("q3ai_way_deadkai");
    location lWay4 = GetLocation(oWay4);
    location lKai = GetLocation(oDeadKai);
    CreateObject(OBJECT_TYPE_CREATURE,"soulharvester",lWay4);
    CreateObject(OBJECT_TYPE_CREATURE,"os_dead_kai",lKai);
}
