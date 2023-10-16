//::///////////////////////////////////////////////
//:: Name q2d_ent_formatk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if the formians are helping the PCs,
    They will spawn in and attack the drow at this
    point.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 25/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void CreateFormian(location lSpawn);
void CreateFormianQueen(location lSpawn);
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    if (GetLocalInt(GetModule(), "X2_Q2DFormiansHelp") != 2)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);

    location lSpawn1 = GetLocation(GetWaypointByTag("wp_q2d_formattack_1"));
    location lSpawn1a = GetLocation(GetWaypointByTag("wp_q2d_formattack_1a"));
    location lSpawn2 = GetLocation(GetWaypointByTag("wp_q2d_formattack_2"));
    location lSpawn2a = GetLocation(GetWaypointByTag("wp_q2d_formattack_2a"));
    location lSpawn2b = GetLocation(GetWaypointByTag("wp_q2d_formattack_2b"));
    location lSpawn3 = GetLocation(GetWaypointByTag("wp_q2d_formattack_3"));
    location lSpawn3a = GetLocation(GetWaypointByTag("wp_q2d_formattack_3a"));
    location lSpawn4 = GetLocation(GetWaypointByTag("wp_q2d_formattack_4"));
    location lSpawn4a = GetLocation(GetWaypointByTag("wp_q2d_formattack_4a"));

    float fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormian(lSpawn1));
    fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormian(lSpawn1a));
    fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormianQueen(lSpawn2));
    fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormian(lSpawn2a));
    fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormian(lSpawn2b));
    fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormian(lSpawn3));
    fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormian(lSpawn3a));
    fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormian(lSpawn4));
    fDelay = IntToFloat(Random(6));
    DelayCommand(fDelay, CreateFormian(lSpawn4a));


}
void CreateFormian(location lSpawn)
{
    effect eVfx = EffectVisualEffect(137);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx, lSpawn);
    object oFormian = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2_formwar", lSpawn);
}

void CreateFormianQueen(location lSpawn)
{
    effect eVfx = EffectVisualEffect(137);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx, lSpawn);
    object oFormian = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2_formqueen", lSpawn);
}
