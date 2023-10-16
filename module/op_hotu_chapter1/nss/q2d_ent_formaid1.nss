//::///////////////////////////////////////////////
//:: Name q2d_ent_formaid1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PCs have decided to enlist the formians
    aid - the formians will appear here to talk
    to the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 25/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //If the PC has already seen the drow camp
    if (GetLocalInt(oPC, "X2_Q2DCentralDrowCamp") == 1)
        return;
    //if the PC has not earned the formians aid.
    if (GetLocalInt(GetModule(), "X2_Q2DFormiansHelp") != 1)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    //Formians have been enlisted to help, so spawn them in and
    //have the queen speak to the PC
    object oSpawn1 = GetWaypointByTag("wp_q2d_formspawn_1");
    object oSpawn2 = GetWaypointByTag("wp_q2d_formspawn_2");
    object oSpawn3 = GetWaypointByTag("wp_q2d_formspawn_3");

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(137), GetLocation(oSpawn1));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(137), GetLocation(oSpawn2));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(137), GetLocation(oSpawn3));

    object oQueen = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2_formqueen", GetLocation(oSpawn1));
    CreateObject(OBJECT_TYPE_CREATURE, "x2_q2_formwar", GetLocation(oSpawn2), FALSE, "q2d_cutformhelp1");
    CreateObject(OBJECT_TYPE_CREATURE, "x2_q2_formwar", GetLocation(oSpawn3), FALSE, "q2d_cutformhelp2");

    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_s", GetLocation(oSpawn1));
    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_s", GetLocation(oSpawn2));
    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_s", GetLocation(oSpawn3));

    DelayCommand(1.0, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(1.5, AssignCommand(oQueen, ActionStartConversation(oPC)));
}
